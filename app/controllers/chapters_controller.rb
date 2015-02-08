class ChaptersController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy, :update, :edit]
	before_action :correct_user, only: :destroy

	def new
		@novel = Novel.find(params[:novel_id])
		@chapter = Chapter.new
	end

	def create 
		@novel = Novel.find(params[:novel_id])
		@chapter = @novel.chapters.build(chapters_params)
		@chapter.user_id = current_user.id
		@chapter.save
		redirect_to @novel
	end

	def destroy
		@chapter = Chapter.find(params[:id])
		@chapter.destroy
		@novel = Novel.find(params[:novel_id])
		redirect_to @novel
	end

	def show
		@chapter = Chapter.find(params[:id])
		@previous = Chapter.where("id < ?", params[:id]).order(:id).first   
    @next = Chapter.where("id > ?", params[:id]).order(:id).first 
	end

	def edit
		@novel =Novel.find(params[:novel_id])
		@chapter = Chapter.find(params[:id])
	end

	def update
		@novel =Novel.find(params[:novel_id])
		@chapter = Chapter.find(params[:id])
		if @chapter.update(chapters_params)
			redirect_to @novel
		else
			render 'edit'
		end
	end

	private

	def chapters_params
		params.require(:chapter).permit(:user_id, :novel_id, :title, :content)
	end

	def correct_user
		unless current_user.admin?
			@chapter = current_user.chapters.find_by(id: params[:id])
			redirect_to root_url if @chapter.nil?
		end
	end
end
