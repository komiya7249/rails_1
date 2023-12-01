class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end


  def new
    @schedule = Schedule.new
  
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:scheduleId,:title,:startday,:endday,:updateday,:text,:checkbox))
    if @schedule.save
      flash[:notice] = "予定を登録しました"
      redirect_to :schedules
    else
      flash[:notice_error] = "予定の登録に失敗しました"
      render"new"
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:scheduleId,:title,:startday,:endday,:updateday,:text,:checkbox))
      flash[:notice] = "ID:#{@schedule.id} #{@schedule.title}の予定を更新しました"
      redirect_to:schedules
    else
      flash[:notice_error] = "予定の更新に失敗しました"
      render"edit"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    if @schedule.destroy
    flash[:notice] = "予定を削除しました"
    redirect_to:schedules
    end
  end

end


