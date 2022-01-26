class SchemasController < ApplicationController
  before_action :set_schema, only: [:show, :update, :destroy]
  def index
    @schemas = current_user.schemas
  end

  def new
    @schema = Schema.new
  end

  def create
    schema = Schema.new(schema_params)
    schema.user = current_user
    if schema.save
      redirect_to schema_path(schema)
    else
      render :new
    end
  end

  def show
    redirect_to new_schema_path unless @schema.user == current_user
  end

  def update
    @schema.update(content: params[:content])
  end

  def destroy
    @schema.destroy!
    redirect_to schemas_path
  end

  private

  def set_schema
    @schema = Schema.find(params[:id])
  end

  def schema_params
    params.require(:schema).permit(:name, :content)
  end
end
