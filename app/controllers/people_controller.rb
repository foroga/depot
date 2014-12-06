class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
	before_action :set_unit, only: [:index, :new]
	before_action :set_units, only: [:new, :edit, :update, :create]

  # GET /people
  # GET /people.json
  def index
		if @unit
			@people = @unit.people
		else
	    @people = Person.all
		end
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new(:unit_id => @unit.id)
  end

  # GET /people/1/edit
  def edit
		@units = Unit.order('name ASC')
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
				UserMailer.welcome_email(@person).deliver
		    format.html { redirect_to people_url(:unit_id=>@person.unit_id), 
		                  notice: 'Person was successfully created.' }
		    format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
#				redirect_to(:action => 'index')
      format.html { redirect_to people_url(:unit_id=>@person.unit_id), 
                    notice: 'Person was successfully updated.' }
      format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url(:unit_id=>@person.unit_id), 
                    notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    def set_unit
      @unit = Unit.find(params[:unit_id])
    end

    def set_units
			@units = Unit.order('name ASC')
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:unit_id, :nickname, :accesslevel, :name, :surname, :email, :telefone, :password, :active, :note)
    end
end
