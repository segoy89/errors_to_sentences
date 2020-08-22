require "errors_to_sentences/version"
require "active_model/errors"

module ErrorsToSentences
  def to_sentences
    sentences = []

    messages.each do |attr, msgs|
      if msgs.size > 1
        sentences << generate_sentence(attr, msgs.dup)
      else
        sentences += full_messages_for(attr)
      end
    end

    sentences
  end

  private

  def generate_sentence(attr, msgs)
    last_msg = msgs.slice!(-1)
    "#{attr} #{msgs.join(', ')} and #{last_msg}".humanize
  end
end

ActiveModel::Errors.send(:include, ErrorsToSentences)
