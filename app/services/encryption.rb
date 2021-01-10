module Encryption
    include BCrypt

    def encrypt(id)
      Password.create(id)
    end

    def validate_encryption(encrypted_id, id)
      Password.new(encrypted_id) == id
    end
end