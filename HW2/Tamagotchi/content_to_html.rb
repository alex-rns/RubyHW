def content_to_html(pet)
  "<header>
  <span>#{pet.name}</span>
  <span>#{pet.attention_phrase}</span>
  </header>
  <main>
  <section>
    <ul>
      <li>Life: <strong>#{pet.life}</strong></li>
      <li>Age: <strong>#{pet.age}</strong></li>
      <li>Mood: <strong>#{pet.mood * 5}%</strong></li>
      <li>Hunger: <strong>#{pet.hunger * 10}%</strong></li>
      <li>Sleep: <strong>#{pet.sleep * 5}%</strong></li>
      <li>WC: <strong>#{pet.wc * 10}%</strong></li>
      <li>Study: <strong>#{pet.study}</strong></li>
    </ul>
  </section>

  <article>
    <div>
      <p>#{pet.phrase}</p>
    </div>
    <div>
      <p>#{pet.minion_phrase}</p>
    </div>
  </article>
  <aside>
    <p>#{pet.emoji}</p>
  </aside>
  </main>
  <footer>
  <p>List of available commands:</p>
  <p> 1 - help, 2 - status, 3 - feed, 4 - sleep, 5 - wc, 6 - walk, 7 - teach,
 8 - clean, 9 - play, 10 - super-skill, 11 - exit" +
    if pet.owner == "admin"
      ", 12 - change-name"
    elsif pet.owner == "superadmin"
      ", 12 - change-name, 13 - change-data, 14 - kill-pet, 15 - reset-data"
    else ""
    end +
    "</p>
  </footer>
  <script>
      setInterval(()=>{window.location.reload()}, 1000)
  </script>"
end
