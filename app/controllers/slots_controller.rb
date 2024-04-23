class SlotsController < ApplicationController
  def index
    coach = Coach.find(params[:coach_id])
    slots = coach.slots.map do |slot|
      {
        title: "Book #{coach.name}",
        start: slot.start_time,
        end: slot.end_time
      }
    end
    render json: slots
  end
end
