class NovelsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy, :update, :edit]
	before_action :correct_user, only: :destroy

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
		redirect_to user_path
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
		@novel.liked_by current_user
		redirect_to @novel
	end

	def removemark
		@novel = Novel.find(params[:id])
		@novel.unliked_by current_user
		redirect_to @novel
	end

	private

	def novel_params
		params.require(:novel).permit(:title, :summary, :author, :user_id)
	end

	def correct_user
		unless current_user.admin?
			@novel = current_user.novels.find_by(id: params[:id])
			redirect_to root_url if @novel.nil?
		end
	end

end
