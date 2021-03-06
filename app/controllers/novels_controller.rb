class NovelsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy, :update, :edit]
	before_action :correct_user, only: [:destroy, :update, :edit]

	def new
		@novel = Novel.new
	end

	def create
		@novel = current_user.novels.build(novel_params)
		if @novel.save
			redirect_to novel_url(@novel)
		else
			redirect_to "/novels/new"
		end
	end

	def destroy
		@novel = Novel.find(params[:id])
		@novel.destroy
		redirect_to root_url
	end

	def show
		@novel = Novel.find(params[:id])
	end

	def edit
		@novel = Novel.find(params[:id])
	end

	def update
		@novel = Novel.find(params[:id])
		if @novel.update(novel_params)
			redirect_to @novel
		else
			render "edit"
		end
	end

	def bookmark
		@novel = Novel.find(params[:id])
		@novel.record_timestamps = false
		@novel.liked_by current_user
		redirect_to @novel
	end

	def removemark
		@novel = Novel.find(params[:id])
		@novel.record_timestamps = false
		@novel.unliked_by current_user
		redirect_to @novel
	end

	private

	def novel_params
		params.require(:novel).permit(:title, :summary, :author, :user_id, :picture)
	end

	def update_novel_last_chapter_at
    self.novel.touch(:last_chapter_at) if self.novel
  end

	def correct_user
		unless current_user.admin?
			@novel = current_user.novels.find_by(id: params[:id])
			redirect_to root_url if @novel.nil?
		end
	end

end
