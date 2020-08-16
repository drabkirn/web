class Api::V1::FeerrorsController < ApplicationController

  def create
    @exception_track = ExceptionTrack::Log.new(exception_track_params)
    if @exception_track.save
      send_response = {
        status: 200,
        message: Message.feerror_reported,
        data: {
          message: Message.feerror_reported
        }
      }
      json_response(send_response)
    end

    raise ExceptionHandler::ConsumerError.new(@exception_track, request.env), Message.consumer_exception_raised
  end

  private
    def exception_track_params
      params.require(:feerror).permit(:title, :body)
    end
end
