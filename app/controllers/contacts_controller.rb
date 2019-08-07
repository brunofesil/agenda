class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    @contact.build_adress
    #@contact.build_phones
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path
    else
      render :new, notice: "Não foi possível criar um novo contato."
    end
  end

  # GET /contacts/1
  def edit
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    if @contact.update(contact_params)
      redirect_to contacts_path
    else
      render :new, notice: "Não foi possível editar um novo contato."
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_params
    params.require(:contact).permit(:name,
      adress_attributes: [:street, :number, :neighborhood], phones_attributes: [:id, :number, :_destroy]
    )
  end
end
