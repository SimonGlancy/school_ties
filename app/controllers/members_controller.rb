class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def new
    @schools = School.all.map{|s| [s.name, s.id]}
    @schools << "N/A"
    @member = Member.new
    @member.attendances.new
  end

  def create
    @member = Member.create(member_params)
    attendances_array.each do |school_id|
      @member.attendances.create(school_id: school_id)
    end

    redirect_to "/members"
  end

  private

  def member_params
    params.require(:member).permit(:name, :email, attendances_attributes: [:school_id])
  end

  def attendances_params
    params.require(:attendances).permit(:school_id1,:school_id2,:school_id3)
  end

  def attendances_array
    array = []
    attendances_params.each_key {|key| array << attendances_params[key]}
    array
  end

end
