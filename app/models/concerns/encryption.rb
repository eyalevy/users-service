module Encryption
  extend self

    def encrypt(id)
      CipherUtils.encrypt_id(id)
    end

    def decrypt(encrypted_id)
      CipherUtils.decrypt_id(encrypted_id)
    end
end