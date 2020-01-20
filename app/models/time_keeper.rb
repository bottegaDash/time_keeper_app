class TimeKeeper < ApplicationRecord
  has_one :user

  def self.start_task(user_id, task_id)
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

  def self.end_task(user_id)
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
