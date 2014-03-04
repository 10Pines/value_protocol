module ValueProtocol

  module Protocol

    def call *args
      self
    end

    def to_proc
      proc{ |*args| self.call *args }
    end

  end

end