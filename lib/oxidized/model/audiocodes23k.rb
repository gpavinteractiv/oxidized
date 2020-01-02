class AudioCodes23k < Oxidized::Model
  # AudioCodes 2000 & 3000 devices (tested on firmware v5.80, v6.00) ; adapted from audiocodesmp.rb 

  prompt /^\/\w*>/

  comment ';'

  cmd "conf\r\n" do
  end

  cmd 'cf get' do |cfg|
    cfg
  end

  cfg :ssh do
    username /^login as:\s$/
    password /^.+password:\s$/
    pre_logout "exit\r\n"
  end

  cfg :telnet do
    username /login:\s$/
    password /password:\s$/
    pre_logout "exit\r\n"
  end
end
