module CipherUtils
  extend self

  ORIGINAL_SSN_ENCRYPTION_KEY =
    'qyNDvoKaRNiRwCE-aNA7c7lSieYOwt9Q8D4rQHqLO_VJpnWGV6BOHvgUXQh3nGk93Pqat0BN-ldBXdSfSfHGKa0FYWdsYGYpbTMtFByCP4F8cZSvLMIRM2Q1bMjACZjOa2Ex9i0chWI2ll9TCzfaoOSfEH5hAMwes7e2YsNIRwo'
  SSN_ENCRYPTION_KEY = ORIGINAL_SSN_ENCRYPTION_KEY[0, 32]

  SSN_ENCRYPTION_ALGO = 'aes-256-cbc'
  LEFT_OPERATOR_IDS = [4, 5, 7, 9, 3, 8, 2, 4, 1, 6]
  RIGHT_OPERATOR_IDS = [8, 7, 4, 2, 5, 9, 6, 4, 1, 3]

  def encrypt_id(id)
    last_char_of_id = id.to_s.last.to_i
    left_operator = LEFT_OPERATOR_IDS[last_char_of_id].to_i
    right_operator = RIGHT_OPERATOR_IDS[last_char_of_id].to_i

    enc_id = (id * (left_operator + right_operator)).to_s().upcase
    "#{left_operator}#{enc_id}#{right_operator}"
  end

  def decrypt_id(encrypted_id)
    return unless encrypted_id.present?

    encrypted = encrypted_id
    multiplied_number = encrypted[1...-1].to_i(16)

    return if multiplied_number.zero?
    return if encrypted.first.to_i.zero? || encrypted.last.to_i.zero?

    multiplied_number / (encrypted.first.to_i + encrypted.last.to_i)
  end

end
