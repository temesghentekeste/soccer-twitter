class VotesController < ApplicationController
  def create
    opinion_id = params[:opinion_id]

    vote = Vote.new
    vote.opinion_id = opinion_id
    vote.upvote = params[:upvote]
    vote.user_id = current_user.id

    existing_vote = Vote.where(user_id: current_user.id, opinion_id: opinion_id)
    @is_new_vote = true

    respond_to do |format|
      format.js {
        
        if existing_vote.size > 0
          existing_vote.first.destroy
          @is_new_vote = false
        else
          if vote.save
            @success = true
          else
            @success = false
          end
        end
        @opinion = Opinion.find(opinion_id)
        @is_upvote = params[:upvote]
        render "votes/create"
      }
    end

  end 

  private

  def vote_params
    params.require(:vote).permit(:upvote, :opinion_id)
  end
end