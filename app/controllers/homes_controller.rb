class HomesController < ApplicationController
  def top
  	@diaries = Diary.all
  end

  def about
  end
end
