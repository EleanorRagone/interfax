module Interfax
  class Fax
    attr_reader :userId, :id, :phoneNumber, :remoteCSID, :messageStatus, :pages, :messageSize, :messageType, :receiveTime, :callerID, :recordingDuration, :imageStatus, :numOfEmails, :numOfFailedEmails
  end
end