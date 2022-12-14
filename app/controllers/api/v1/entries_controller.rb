class Api::V1::EntriesController < ApiController
    before_action :set_entry, only: %i[ show edit update destroy ]
    skip_before_action :doorkeeper_authorize!, only: %i[create index show new edit update destroy]
       
    include DoorkeeperRegisterable
    # GET /entries or /entries.json
    def index
      @entries = Entry.all
      respond_to do |format|
        format.json { render json: @entries }
        format.html { redirect_to root_url }
      end
    end
  
    # GET /entries/1 or /entries/1.json
    def show
    end
  
    # GET /entries/new
    def new
      @entry = Entry.new
    end
  
    # GET /entries/1/edit
    def edit
    end
  
    # POST /entries or /entries.json
    def create      
      @entry = Entry.new(entry_params)      
        if @entry.save
          render json: { status: :ok}
          # format.html { redirect_to entry_url(@entry), notice: "Entry was successfully created." }
          # format.json { render :show, status: :created, location: @entry }
        else
          # format.html { render :new, status: :unprocessable_entity }
          # format.json { render json: @entry.errors, status: :unprocessable_entity }
          render json:  {status: :unprocessable_entity}        
      end
    end
  
    # PATCH/PUT /entries/1 or /entries/1.json
    def update
      respond_to do |format|
        if @entry.update(entry_params)
          format.html { redirect_to entry_url(@entry), notice: "Entry was successfully updated." }
          format.json { render :show, status: :ok, location: @entry }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @entry.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /entries/1 or /entries/1.json
    def destroy
      @entry.destroy
  
      respond_to do |format|
        format.html { redirect_to entries_url, notice: "Entry was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_entry
        @entry = Entry.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def entry_params
        params.permit(:upload, :download, :lat, :lng)
      end
  end