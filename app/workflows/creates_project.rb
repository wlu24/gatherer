class CreatesProject
  attr_accessor :name, :project, :task_string

  def initialize(name: "", task_string: "")
    @name = name
    @task_string = task_string
    @success = false
  end

  def build
    self.project = Project.new(name: name)
    project.tasks = convert_string_to_tasks
    project
  end

  def convert_string_to_tasks
    task_string.split("\n").map do |task_string|
      task_title, task_size_string = task_string.split(':')
      Task.new(title: task_title, size: size_as_integer(task_size_string) )
    end
  end

  def size_as_integer(size_str)
    size_str.nil? ? 1 : [size_str.to_i, 1].max
  end

  def create
    build
    @success = project.save
  end

  def success?
    @success
  end

end
