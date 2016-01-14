class Dock
	@a = 3
	def initialize()
		@a = 6
	end
end

class Qualiq
	attr_accessor :p
	def initialize(passive)
		@p = passive
	end
	['+','-'].each do |o|
		define_method(o) do |op|
			return eval("Qualiq.new(self.p#{o}op.p)")
		end
	end
	def method_missing(o, *op)
		return eval("Qualiq.new(self.p#{o}op[0].p)")
	end
end

p01 = Qualiq.new(Dock.instance_variable_get(:@a))
p02 = Qualiq.new(Dock.new.instance_variable_get(:@a))
p (p01.send("+",p02)-p01.send("*",p02)/p01).p