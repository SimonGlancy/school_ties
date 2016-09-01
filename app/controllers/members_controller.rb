class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def new
    @schools = School.all.map{|s| [s.name, s.id]}
    @member = Member.new
  end

  def create
    p params
    @member = Member.create(member_params)
    @member.attendances.create(attendances_params)

    redirect_to "/members"
  end

  private

  def member_params
    params.require(:member).permit(:name, :email)
  end

  def attendances_params
    params.require(:attendances).permit({:school_id => []})
  end

end
