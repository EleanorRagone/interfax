module Interfax
  class Fax
    attr_accessor :userId, :id, :phoneNumber, :remoteCSID, :messageStatus, :pages, :messageSize, :messageType, :receiveTime, :callerID, :recordingDuration, :imageStatus, :numOfEmails, :numOfFailedEmails
    attr_accessor :image

    def initialize vals = {}
      return if vals == {}
      self.userId             = vals["userId"]
      self.id                 = vals["messageId"]
      self.phoneNumber        = vals["phoneNumber"]
      self.remoteCSID         = vals["remoteCSID"]
      self.messageStatus      = vals["messageStatus"]
      self.pages              = vals["pages"]
      self.messageSize        = vals["messageSize"]
      self.messageType        = vals["messageType"]
      self.receiveTime        = vals["receiveTime"]
      self.callerID           = vals["callerID"]
      self.recordingDuration  = vals["recordingDuration"]
      self.imageStatus        = vals["imageStatus"]
      self.numOfEmails        = vals["numOfEmails"]
      self.numOfFailedEmails  = vals["numOfFailedEmails"]
    end

    def image
      return unless self.id
      self.image = Interfax::Inbound.image self.id
    end

    def read!
      return unless self.id
      self.messageStatus = Interfax::Inbound.markRead self.id
    end

    def unread!
      return unless self.id
      self.messageStatus = Interfax::Inbound.markUnread self.id
    end
  end
end