class UnitsController < ApplicationController
  before_action :set_unit, only: [:show, :edit, :update, :destroy]
	before_action :set_group, only: [:index, :new]

  # GET /units
  # GET /units.json
  def index
		if @group
			@units = @group.units
		else
	    @units = Unit.all
		end
  end

  # GET /units/1
  # GET /units/1.json
  def show
  end

  # GET /units/new
  def new
		@groups = Group.order('name ASC')
    @unit = Unit.new({:group_id => @group.id})
  end

  # GET /units/1/edit
  def edit
		@groups = Group.order('name ASC')
  end

  # POST /units
  # POST /units.json
  def create
    @unit = Unit.new(unit_params)

    respond_to do |format|
      if @unit.save
        format.html { redirect_to @unit, notice: 'Unit was successfully created.' }
        format.json { render :show, status: :created, location: @unit }
      else
        format.html { render :new }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /units/1
  # PATCH/PUT /units/1.json
  def update
    respond_to do |format|
      if @unit.update(unit_params)
        format.html { redirect_to @unit, notice: 'Unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @unit }
      else
        format.html { render :edit }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /units/1
  # DELETE /units/1.json
  def destroy
    @unit.destroy
    respond_to do |format|
      format.html { redirect_to units_url(:group_id=>@unit.group_id) , notice: 'Unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:id])
    end

    def set_group
      @group = Group.find(params[:group_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_params
      params.require(:unit).permit(:group_id, :name, :email, :telefone, :active, :note, :acount_id)
    end
end
