class DiplomsController < ApplicationController
  before_action :set_diplom, only: [:show, :edit, :update, :destroy]

  # GET /diploms
  # GET /diploms.json
  def index
    @diploms = Diplom.all
  end

def download_pdf
  output = DiplomsReport.new.to_pdf
  send_data output, :type => 'application/pdf', :filename => "diploms.pdf"
end

  # GET /diploms/1
  # GET /diploms/1.json
  def show
  end

  # GET /diploms/new
  def new
    @diplom = Diplom.new
  end

  # GET /diploms/1/edit
  def edit
  end

  # POST /diploms
  # POST /diploms.json
  def create
    @diplom = Diplom.new(diplom_params)

    respond_to do |format|
      if @diplom.save
        format.html { redirect_to @diplom, notice: 'Diplom was successfully created.' }
        format.json { render action: 'show', status: :created, location: @diplom }
      else
        format.html { render action: 'new' }
        format.json { render json: @diplom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diploms/1
  # PATCH/PUT /diploms/1.json
  def update
    respond_to do |format|
      if @diplom.update(diplom_params)
        format.html { redirect_to @diplom, notice: 'Diplom was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @diplom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diploms/1
  # DELETE /diploms/1.json
  def destroy
    @diplom.destroy
    respond_to do |format|
      format.html { redirect_to diploms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diplom
      @diplom = Diplom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diplom_params
      params.require(:diplom).permit(:name, :amount)
    end
end
