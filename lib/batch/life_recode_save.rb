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
			life_recode.exercise_memo = life.exercise_memo
			life_recode.life_date = DateTime.now
			life_recode.save
			life.study_time = 0
			life.sleeping_time = 0
			life.exercise_time = 0
			life.study_memo = nil
			life.sleeping_memo = nil
			life.exercise_memo = nil
			life.save
		 end
	end
end