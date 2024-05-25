# Class Task untuk menyimpan informasi tugas
class Task
  attr_accessor :name, :completed

  def initialize(name)
    @name = name
    @completed = false
  end
end

# Class ToDoList untuk mengelola daftar tugas
class ToDoList
  def initialize
    @tasks = []
  end

  def add_task(name)
    task = Task.new(name)
    @tasks << task
    puts "Tugas '#{name}' berhasil ditambahkan."
  end

  def list_tasks
    puts "\nDaftar Tugas:"
    @tasks.each_with_index do |task, index|
      status = task.completed ? "[x]" : "[ ]"
      puts "#{index + 1}. #{status} #{task.name}"
    end
  end

  def complete_task(index)
    task = @tasks[index - 1]
    if task
      task.completed = true
      puts "Tugas '#{task.name}' telah diselesaikan."
    else
      puts "Tugas tidak ditemukan."
    end
  end

  def remove_task(index)
    task = @tasks.delete_at(index - 1)
    if task
      puts "Tugas '#{task.name}' berhasil dihapus."
    else
      puts "Tugas tidak ditemukan."
    end
  end
end

# Main program
def main
  todo_list = ToDoList.new

  loop do
    # Menampilkan menu
    puts "\nAplikasi To-Do List Ruby"
    puts "1. Tambah Tugas"
    puts "2. Tandai Tugas Selesai"
    puts "3. Hapus Tugas"
    puts "4. Lihat Daftar Tugas"
    puts "5. Keluar"
    print "Masukkan pilihan: "
    choice = gets.chomp.to_i

    case choice
    when 1
      print "Masukkan nama tugas: "
      task_name = gets.chomp
      todo_list.add_task(task_name)
    when 2
      print "Masukkan nomor tugas yang selesai: "
      task_index = gets.chomp.to_i
      todo_list.complete_task(task_index)
    when 3
      print "Masukkan nomor tugas yang akan dihapus: "
      task_index = gets.chomp.to_i
      todo_list.remove_task(task_index)
    when 4
      todo_list.list_tasks
    when 5
      puts "Keluar dari aplikasi."
      break
    else
      puts "Pilihan tidak valid."
    end
  end
end

main
