class Batch::TaskReset
	def self.task_reset
		 customs = Custom.all
		 customs.each do |custom|
		 	custom.task_status = 0
		 	custom.save
		 end
	end
end