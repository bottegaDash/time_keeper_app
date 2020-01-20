class TimeKeeper < ApplicationRecord

  def self.start_task(task_id)
    user_id = 1
    current_time = TimeKeeper.where("user_id=="+user_id.to_s()).last
    if current_time
      if current_time.user_id != task_id
        TimeKeeper.end_task
        TimeKeeper.create(task_id: task_id, user_id: user_id, start_time: DateTime.now)
      end
    else
      TimeKeeper.create(task_id: task_id, user_id: user_id, start_time: DateTime.now)
    end
  end

  def self.end_task
    user_id = 1
    end_time = DateTime.now
    current_time = TimeKeeper.where("user_id=="+user_id.to_s()).last
    current_time.end_time = end_time
    current_time.save()
  end

  def self.update(tk, new_time)
    tk.end_time = new_time
    tk.save()
  end
end
