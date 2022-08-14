class Api::V1::Android::EntriesController < ApplicationController
    include ApplicationHelper
    before_action :set_entry, only: %i[ show ]
    skip_before_action :doorkeeper_authorize!
    before_action :is_admin?
    
    # GET /entries or /entries.json
    def index
      @entries = Entry.all
      respond_to do |format|
        format.json { render json: @entries }
      end
    end
  
    # GET /entries/1 or /entries/1.json
    def show
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_entry
        @entry = Entry.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def entry_params
        params.require(:entry).permit(:upload, :download)
      end
  end
  