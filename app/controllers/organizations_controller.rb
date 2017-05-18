class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        format.html do
          redirect_to @organization,
                      notice: 'Organization was successfully created.'
        end
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json do
          render json: @organization.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html do
          redirect_to @organization,
                      notice: 'Organization was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json do
          render json: @organization.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.update(active: false)
    respond_to do |format|
      format.html do
        redirect_to organizations_url,
                    notice: 'Organization was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_organization
    @organization = Organization.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def organization_params
    params.require(:organization)
          .permit(:name, :base_uri, :full_domain,
                  :harvest_id, :harvest_key, :active)
  end
end
