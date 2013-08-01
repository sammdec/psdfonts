require 'bindata/base_primitive'

module BinData
  # Resets the stream alignment to the next byte.  This is
  # only useful when using bit-based primitives.
  #
  #    class MyRec < BinData::Record
  #      bit4 :a
  #      resume_byte_alignment
  #      bit4 :b
  #    end
  #
  #    MyRec.read("\x12\x34") #=> {"a" => 1, "b" => 3}
  #
  class ResumeByteAlignment < BinData::Base
    def clear; end
    def clear?; true; end
    def assign(val); end
    def snapshot; nil; end
    def do_num_bytes; 0; end

    def do_read(io)
      io.reset_read_bits
    end

    def do_write(io)
      io.flushbits
    end
  end

  # A monkey patch to force byte-aligned primitives to
  # become bit-aligned.  This allows them to be used at
  # non byte based boundaries.
  #
  #     class BitString < BinData::String
  #       bit_aligned
  #     end
  #
  #     class MyRecord < BinData::Record
  #       bit4       :preamble
  #       bit_string :str, :length => 2
  #     end
  #
  module BitAligned
    class BitAlignedIO
      def initialize(io)
        @io = io
      end
      def readbytes(n)
        n.times.inject("") do |bytes, i|
          bytes << @io.readbits(8, :big).chr
        end
      end
      def method_missing(sym, *args, &block)
        @io.send(sym, *args, &block)
      end
    end

    def read_and_return_value(io)
      super(BitAlignedIO.new(io))
    end

    def do_num_bytes
      super.to_f
    end

    def do_write(io)
      value_to_binary_string(_value).each_byte { |v| io.writebits(v, 8, :big) }
    end
  end

  class BasePrimitive < BinData::Base
    def self.bit_aligned
      include BitAligned
    end
  end

  class Primitive < BinData::BasePrimitive
    def self.bit_aligned
      fail "'bit_aligned' is not needed for BinData::Primitives"
    end
  end
end
