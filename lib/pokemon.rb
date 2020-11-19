class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db

  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?);"
    db.execute(sql, name, type)
  end

  def self.update
    sql = "UPDATE pokemon SET name = ?, type = ? WHERE id = ?;"
    db.execute(sql, self.name, self.type, self.id)
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?;"
    info = db.execute(sql, id).first
    self.new(id: info[0], name: info[1], type: info[2], db: db)
  end

end
