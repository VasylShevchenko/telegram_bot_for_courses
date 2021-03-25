require 'byebug'
require 'dotenv/load'
require 'telegram/bot'

TOKEN = ENV['TOKEN']

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    # case message.text
    # when '/start'
    #   bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    # when '/stop'
    #   bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    # end

    answers = [
      "As I see it, yes (Мне кажется — «да»)",
      "Most likely (Вероятнее всего)",
      "Outlook good (Хорошие перспективы)",
      "Signs point to yes (Знаки говорят — «да»)",
      "Yes (Да)",
      "Reply hazy, try again (Пока не ясно, попробуй снова)",
      "Ask again later (Спроси позже)",
      "Better not tell you now (Лучше не рассказывать)",
      "Cannot predict now (Сейчас нельзя предсказать)",
      "Concentrate and ask again (Сконцентрируйся и спроси опять)",
      "Don’t count on it (Даже не думай)",
      "My reply is no (Мой ответ — «нет»)",
      "My sources say no (По моим данным — «нет»)",
      "Outlook not so good (Перспективы не очень хорошие)",
      "Very doubtful (Весьма сомнительно)",
    ].sample

    bot.api.send_message(chat_id: message.chat.id, text: answers)
  end
end
