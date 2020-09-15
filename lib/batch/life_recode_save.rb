class Batch::LifeRecodeSave
	def self.life_recode_save
		 lifes = Life.all
		 lifes.each do |life|
		 	life_recode = LifeRecode.new
		 	life_recode.user_id = life.user.id
			life_recode.study_time = life.study_time
			life_recode.sleeping_time = life.sleeping_time
			life_recode.exercise_time = life.exercise_time
			life_recode.study_memo = life.study_memo
			life_recode.sleeping_memo = life.sleeping_memo
			life_recode.save
			life.destroy
		 end
	end
end