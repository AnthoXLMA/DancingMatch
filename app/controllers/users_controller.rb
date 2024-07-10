class UsersController < ApplicationController
  before_action :set_user, only: [:index, :create, :new, :show, :edit, :update, :destroy, :sign_out]
  # layout false
  def index
    @users = User.all
    @user = current_user
    @dances = Dance.all
    if params[:query].present? || params[:gender_query].present? || params[:name_query].present?
      @users  = User.where("location ILIKE ?", "%#{params[:query]}%")
                    .where("gender ILIKE ?", "%#{params[:gender_query]}%")
                    .where("first_name ILIKE ?", "%#{params[:name_query]}%")
    else
      @users =  User.all
    end

    @subscriptions = Subscription.where(user_id: :id)

    @dancers = @users.geocoded.map do |user|
      if user.gender == 'Gentleman'
        {
          lat: user.latitude,
          lng: user.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
          image_url: helpers.asset_url('dance-man.png'),
        }
      else
        {
          lat: user.latitude,
          lng: user.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
          image_url: helpers.asset_url('dance-woman.png'),
        }
      end
    end
    @mapmarkers = @markers.to_json

    @appointments = Appointment.all
    @events = @appointments.geocoded.map do |appointment|
      {
        lat: appointment.latitude,
        lng: appointment.longitude,
        infoWindow: render_to_string(partial: "info_window_event", locals: { appointment: appointment }),
        image_url: helpers.asset_url('show-icon.png'),
      }
    end
    @mapevents = @events.to_json

    @profiles = Profile.all

    # GEOLOCALISATION DES DANSEURS DE SALSA
    @partners_of_salsa = []
    @profiles.where(dance_id: 1).each do |salsa_partner|
      @partners_of_salsa << salsa_partner if !@partners_of_salsa.include? salsa_partner
    end
    @salsero_json = []
    @partners_of_salsa.each do |member|
    @salsero_json << member.user
    end
    @salsero_position_on_map = @salsero_json.map do |salserito|
      {
        lat: salserito.latitude,
        lng: salserito.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: salserito }),
        image_url: helpers.asset_url('marker.svg'),
      }
    end
    # GEOLOCALISATION DES DANSEURS DE MERENGUE
    @partners_of_merengue = []
    @profiles.where(dance_id: 2).each do |merengue_partner|
      @partners_of_merengue << merengue_partner if !@partners_of_merengue.include? merengue_partner
    end
    @merengue_json = []
    @partners_of_merengue.each do |member|
    @salsero_json << member.user
    end
    @merengue_position_on_map = @merengue_json.map do |merenguero|
      {
        lat: merenguero.latitude,
        lng: merenguero.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: merenguero }),
        image_url: helpers.asset_url('marker.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE BACHATA
    @partners_of_bachata = []
    @profiles.where(dance_id: 3).each do |bachata_partner|
      @partners_of_bachata << bachata_partner if !@partners_of_bachata.include? bachata_partner
    end
    @bachata_json = []
    @partners_of_bachata.each do |member|
    @bachata_json << member.user
    end
    @bachata_position_on_map = @bachata_json.map do |bachatero|
      {
        lat: bachatero.latitude,
        lng: bachatero.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: bachatero }),
        image_url: helpers.asset_url('mapbox-marker-icon-green.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE KIZOMBA
    @partners_of_kizomba = []
    @profiles.where(dance_id: 4).each do |kizomba_partner|
      @partners_of_kizomba << kizomba_partner if !@partners_of_kizomba.include? kizomba_partner
    end
    @kizomba_json = []
    @partners_of_kizomba.each do |member|
    @kizomba_json << member.user
    end
    @kizomba_position_on_map = @kizomba_json.map do |kizombero|
      {
        lat: kizombero.latitude,
        lng: kizombero.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: kizombero }),
        image_url: helpers.asset_url('mapbox-marker-icon-red.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE REGGAETON
    @partners_of_reggaeton = []
    @profiles.where(dance_id: 5).each do |reggaeton_partner|
      @partners_of_reggaeton << reggaeton_partner if !@partners_of_reggaeton.include? reggaeton_partner
    end
    @reggaeton_json = []
    @partners_of_reggaeton.each do |member|
    @reggaeton_json << member.user
    end
    @reggaeton_position_on_map = @reggaeton_json.map do |reggaetoner|
      {
        lat: reggaetoner.latitude,
        lng: reggaetoner.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: reggaetoner }),
        image_url: helpers.asset_url('mapbox-marker-icon-gray.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE SAMBA
    @partners_of_samba = []
    @profiles.where(dance_id: 6).each do |samba_partner|
      @partners_of_samba << samba_partner if !@partners_of_samba.include? samba_partner
    end
    @samba_json = []
    @partners_of_samba.each do |member|
    @samba_json << member.user
    end
    @samba_position_on_map = @samba_json.map do |sambero|
      {
        lat: sambero.latitude,
        lng: sambero.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: sambero }),
        image_url: helpers.asset_url('mapbox-marker-icon-gray.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE TANGO
    @partners_of_tango = []
    @profiles.where(dance_id: 7).each do |tango_partner|
      @partners_of_tango << tango_partner if !@partners_of_tango.include? tango_partner
    end
    @tango_json = []
    @partners_of_tango.each do |member|
    @tango_json << member.user
    end
    @tango_position_on_map = @tango_json.map do |tangueiro|
      {
        lat: tangueiro.latitude,
        lng: tangueiro.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: tangueiro }),
        image_url: helpers.asset_url('mapbox-marker-icon-gray.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE FLAMENCO
    @partners_of_flamenco = []
    @profiles.where(dance_id: 8).each do |flamenco_partner|
      @partners_of_flamenco << flamenco_partner if !@partners_of_flamenco.include? flamenco_partner
    end
    @flamenco_json = []
    @partners_of_flamenco.each do |member|
    @flamenco_json << member.user
    end
    @flamenco_position_on_map = @flamenco_json.map do |flamenqueiro|
      {
        lat: flamenqueiro.latitude,
        lng: flamenqueiro.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: flamenqueiro }),
        image_url: helpers.asset_url('mapbox-marker-icon-gray.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE JAZZ
    @partners_of_jazz = []
    @profiles.where(dance_id: 9).each do |jazz_partner|
      @partners_of_jazz << jazz_partner if !@partners_of_jazz.include? jazz_partner
    end
    @jazz_json = []
    @partners_of_jazz.each do |member|
    @jazz_json << member.user
    end
    @jazz_position_on_map = @jazz_json.map do |jazzeiro|
      {
        lat: jazzeiro.latitude,
        lng: jazzeiro.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: jazzeiro }),
        image_url: helpers.asset_url('mapbox-marker-icon-gray.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE WEST COAST SWING
    @partners_of_wcs = []
    @profiles.where(dance_id: 10).each do |wcs_partner|
      @partners_of_wcs << wcs_partner if !@partners_of_wcs.include? wcs_partner
    end
    @wcs_json = []
    @partners_of_wcs.each do |member|
    @wcs_json << member.user
    end
    @wcs_position_on_map = @wcs_json.map do |swingueiro|
      {
        lat: swingueiro.latitude,
        lng: swingueiro.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: swingueiro }),
        image_url: helpers.asset_url('mapbox-marker-icon-gray.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE BREAK DANCE
    @partners_of_break = []
    @profiles.where(dance_id: 12).each do |break_partner|
      @partners_of_break << break_partner if !@partners_of_break.include? break_partner
    end
    @break_json = []
    @partners_of_break.each do |member|
    @break_json << member.user
    end
    @break_position_on_map = @break_json.map do |breaker|
      {
        lat: breaker.latitude,
        lng: breaker.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: breaker }),
        image_url: helpers.asset_url('mapbox-marker-icon-gray.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE SALSA PORTORICAINE
    @partners_of_porto = []
    @profiles.where(dance_id: 13).each do |porto_partner|
      @partners_of_porto << porto_partner if !@partners_of_porto.include? porto_partner
    end
    @porto_json = []
    @partners_of_porto.each do |member|
    @porto_json << member.user
    end
    @porto_position_on_map = @porto_json.map do |portoricano|
      {
        lat: portoricano.latitude,
        lng: portoricano.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: portoricano }),
        image_url: helpers.asset_url('mapbox-marker-icon-gray.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE FOX TROT
    @partners_of_foxtrot = []
    @profiles.where(dance_id: 15).each do |foxtrot_partner|
      @partners_of_foxtrot << foxtrot_partner if !@partners_of_foxtrot.include? foxtrot_partner
    end
    @foxtrot_json = []
    @partners_of_foxtrot.each do |member|
    @foxtrot_json << member.user
    end
    @foxtrot_position_on_map = @foxtrot_json.map do |foxtrotter|
      {
        lat: foxtrotter.latitude,
        lng: foxtrotter.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: foxtrotter }),
        image_url: helpers.asset_url('mapbox-marker-icon-gray.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE LINDY HOP
    @partners_of_lindyhop = []
    @profiles.where(dance_id: 16).each do |lindyhop_partner|
      @partners_of_lindyhop << lindyhop_partner if !@partners_of_lindyhop.include? lindyhop_partner
    end
    @lindyhop_json = []
    @partners_of_lindyhop.each do |member|
    @lindyhop_json << member.user
    end
    @lindyhop_position_on_map = @lindyhop_json.map do |lindyhooper|
      {
        lat: lindyhooper.latitude,
        lng: lindyhooper.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: lindyhooper }),
        image_url: helpers.asset_url('mapbox-marker-icon-gray.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE PASO DOBLE
    @partners_of_pasodoble = []
    @profiles.where(dance_id: 17).each do |pasodoble_partner|
      @partners_of_pasodoble << pasodoble_partner if !@partners_of_pasodoble.include? pasodoble_partner
    end
    @pasodoble_json = []
    @partners_of_pasodoble.each do |member|
    @pasodoble_json << member.user
    end
    @pasodoble_position_on_map = @pasodoble_json.map do |pasodobler|
      {
        lat: pasodobler.latitude,
        lng: pasodobler.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: pasodobler }),
        image_url: helpers.asset_url('mapbox-marker-icon-gray.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE MILONGA
    @partners_of_milonga = []
    @profiles.where(dance_id: 18).each do |milonga_partner|
      @partners_of_milonga << milonga_partner if !@partners_of_milonga.include? milonga_partner
    end
    @milonga_json = []
    @partners_of_milonga.each do |member|
    @milonga_json << member.user
    end
    @milonga_position_on_map = @milonga_json.map do |milongueira|
      {
        lat: milongueira.latitude,
        lng: milongueira.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: milongueira }),
        image_url: helpers.asset_url('mapbox-marker-icon-gray.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE LAMBADA
    @partners_of_lambada = []
    @profiles.where(dance_id: 19).each do |lambada_partner|
      @partners_of_lambada << lambada_partner if !@partners_of_lambada.include? lambada_partner
    end
    @lambada_json = []
    @partners_of_lambada.each do |member|
    @lambada_json << member.user
    end
    @lambada_position_on_map = @lambada_json.map do |lambadeira|
      {
        lat: lambadeira.latitude,
        lng: lambadeira.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: lambadeira }),
        image_url: helpers.asset_url('mapbox-marker-icon-gray.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE FORRO
    @partners_of_forro = []
    @profiles.where(dance_id: 20).each do |forro_partner|
      @partners_of_forro << forro_partner if !@partners_of_forro.include? forro_partner
    end
    @forro_json = []
    @partners_of_forro.each do |member|
    @forro_json << member.user
    end
    @forro_position_on_map = @forro_json.map do |forrozeiro|
      {
        lat: forrozeiro.latitude,
        lng: forrozeiro.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: forrozeiro }),
        image_url: helpers.asset_url('mapbox-marker-icon-gray.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE ROCK
    @partners_of_rock = []
    @profiles.where(dance_id: 24).each do |rock_partner|
      @partners_of_rock << rock_partner if !@partners_of_rock.include? rock_partner
    end
    @rock_json = []
    @partners_of_rock.each do |member|
    @rock_json << member.user
    end
    @rock_position_on_map = @rock_json.map do |rocker|
      {
        lat: rocker.latitude,
        lng: rocker.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: rocker }),
        image_url: helpers.asset_url('mapbox-marker-icon-gray.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE TAPDANCE
    @partners_of_tapdance = []
    @profiles.where(dance_id: 25).each do |tapdance_partner|
      @partners_of_tapdance << tapdance_partner if !@partners_of_tapdance.include? tapdance_partner
    end
    @tapdance_json = []
    @partners_of_tapdance.each do |member|
    @tapdance_json << member.user
    end
    @tapdance_position_on_map = @tapdance_json.map do |tapdancer|
      {
        lat: tapdancer.latitude,
        lng: tapdancer.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: tapdancer }),
        image_url: helpers.asset_url('mapbox-marker-icon-gray.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE CHACHA
    @partners_of_chacha = []
    @profiles.where(dance_id: 28).each do |chacha_partner|
      @partners_of_chacha << chacha_partner if !@partners_of_chacha.include? chacha_partner
    end
    @chacha_json = []
    @partners_of_chacha.each do |member|
    @chacha_json << member.user
    end
    @chacha_position_on_map = @chacha_json.map do |chacha_dancer|
      {
        lat: chacha_dancer.latitude,
        lng: chacha_dancer.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: chacha_dancer }),
        image_url: helpers.asset_url('mapbox-marker-icon-gray.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE VALSE
    @partners_of_valse = []
    @profiles.where(dance_id: 29).each do |valse_partner|
      @partners_of_valse << valse_partner if !@partners_of_valse.include? valse_partner
    end
    @valse_json = []
    @partners_of_valse.each do |member|
    @valse_json << member.user
    end
    @valse_position_on_map = @valse_json.map do |valse_dancer|
      {
        lat: valse_dancer.latitude,
        lng: valse_dancer.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: valse_dancer }),
        image_url: helpers.asset_url('mapbox-marker-icon-gray.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE CAPOEIRA
    @partners_of_capoeira = []
    @profiles.where(dance_id: 30).each do |capoeira_partner|
      @partners_of_capoeira << capoeira_partner if !@partners_of_capoeira.include? capoeira_partner
    end
    @capoeira_json = []
    @partners_of_capoeira.each do |member|
    @capoeira_json << member.user
    end
    @capoeira_position_on_map = @capoeira_json.map do |capoeira_dancer|
      {
        lat: capoeira_dancer.latitude,
        lng: capoeira_dancer.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: capoeira_dancer }),
        image_url: helpers.asset_url('mapbox-marker-icon-gray.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE ZUMBA
    @partners_of_zumba = []
    @profiles.where(dance_id: 31).each do |zumba_partner|
      @partners_of_zumba << zumba_partner if !@partners_of_zumba.include? zumba_partner
    end
    @zumba_json = []
    @partners_of_zumba.each do |member|
    @zumba_json << member.user
    end
    @zumba_position_on_map = @zumba_json.map do |zumba_dancer|
      {
        lat: zumba_dancer.latitude,
        lng: zumba_dancer.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: zumba_dancer }),
        image_url: helpers.asset_url('mapbox-marker-icon-gray.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE POLEDANCE
    @partners_of_poledance = []
    @profiles.where(dance_id: 32).each do |poledance_partner|
      @partners_of_poledance << poledance_partner if !@partners_of_poledance.include? poledance_partner
    end
    @poledance_json = []
    @partners_of_poledance.each do |member|
    @poledance_json << member.user
    end
    @poledance_position_on_map = @poledance_json.map do |poledance_dancer|
      {
        lat: poledance_dancer.latitude,
        lng: poledance_dancer.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: poledance_dancer }),
        image_url: helpers.asset_url('mapbox-marker-icon-gray.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE KOMPA
    @partners_of_kompa = []
    @profiles.where(dance_id: 34).each do |kompa_partner|
      @partners_of_kompa << kompa_partner if !@partners_of_kompa.include? kompa_partner
    end
    @kompa_json = []
    @partners_of_kompa.each do |member|
    @kompa_json << member.user
    end
    @kompa_position_on_map = @kompa_json.map do |kompa_dancer|
      {
        lat: kompa_dancer.latitude,
        lng: kompa_dancer.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: kompa_dancer }),
        image_url: helpers.asset_url('mapbox-marker-icon-gray.svg'),
      }
    end

    # GEOLOCALISATION DES DANSEURS DE ZOUK
    @partners_of_zouk = []
    @profiles.where(dance_id: 35).each do |zouk_partner|
      @partners_of_zouk << zouk_partner if !@partners_of_zouk.include? zouk_partner
    end
    @zouk_json = []
    @partners_of_zouk.each do |member|
    @zouk_json << member.user
    end
    @zouk_position_on_map = @zouk_json.map do |zouk_dancer|
      {
        lat: zouk_dancer.latitude,
        lng: zouk_dancer.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: zouk_dancer }),
        image_url: helpers.asset_url('mapbox-marker-icon-gray.svg'),
      }
    end
  end

  def new
    @user = User.new
    @user.save
  end

  def create
    @user = User.find(params[:user_id])
    @profile = @user.profile.build(params[:profile])
    if @profile.save
    flash[:notice] = 'Profile was successfully created.'
    redirect_to(@profile)
    else
    flash[:notice] = 'Error.  Something went wrong.'
    render :action => "new"
    end
    @dance = Dance.new()
    @dance.user = @user
    @user.save
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @appointments = Appointment.all
    @profiles = Profile.all
    @requests = Request.where(user_id: :id)
    @dancing_partners = Request.where(profile: @user.profiles)
    @dances = Dance.all
    # @profile = @user.profiles.each do |profile|
    #   profile
    # end
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url('mapbox-marker-icon-green.svg')
      }
    end

    if params[:query].present?
    @dances = Dance.where("lower(title) LIKE ?", "%#{params[:query].downcase}%")
    else
      @dances = Dance.all
    end
    @appointments_selected = @appointments.map do | my_appointment |
        my_appointment.name
    end
    @review = Review.new
    @request = Request.where(user_id: :id)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @dances = Dance.all
      if @user.update(user_params)
        flash[:notice] = 'User was successfully updated.'
        redirect_to user_path
      else
        render :action => "edit"
    end
  end

  def destroy
    log_out
    redirect_to '/login'
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:gender, :first_name, :last_name, :age,
      :location, :latitude, :longitude, :experience, :contact, :email, :encrypted_password, :password,
      :photo, :city, :level, :xp, :coaching_status, :practice_a_week, :technique, :ambition, :empathie, :social)
  end
end
