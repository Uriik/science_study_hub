import '../models/models.dart';

class ContentRepository {
  static List<Module> getModules() => const [
        // ── Module 1: Living Things & Viruses ──────────────────────────────
        Module(
          id: 'living',
          title: 'Living Things & Viruses',
          pt: 'Seres Vivos e Vírus',
          icon: '🦠',
          color: 'tag-green',
          concepts: [
            Concept(
              en: 'MRS GREN',
              pt: 'Características da Vida',
              desc:
                  'The 7 characteristics of living things: Movement, Respiration, Sensitivity, Growth, Reproduction, Excretion, Nutrition.',
              descPt:
                  'As 7 características dos seres vivos: Movimento, Respiração, Sensibilidade, Crescimento, Reprodução, Excreção, Nutrição.',
              svg: 'mrsg',
            ),
            Concept(
              en: 'Movement (Movimento)',
              pt: 'Mover-se de alguma forma',
              desc:
                  'All living things can move. Animals walk or swim. Plants move their leaves toward sunlight.',
              descPt:
                  'Todos os seres vivos se movem. Animais andam ou nadam. Plantas movem suas folhas em direção à luz solar.',
            ),
            Concept(
              en: 'Respiration (Respiração)',
              pt: 'Liberar energia dos alimentos',
              desc: 'NOT just breathing! Respiration is releasing energy from food inside cells.',
              descPt:
                  'NÃO é apenas respirar! Respiração é liberar energia do alimento dentro das células.',
            ),
            Concept(
              en: 'Sensitivity (Sensibilidade)',
              pt: 'Reagir a estímulos',
              desc:
                  'Responding to changes in the environment (stimuli). A plant grows towards light; you pull your hand from a flame.',
              descPt:
                  'Reagir a mudanças no ambiente. Uma planta cresce em direção à luz; você retira a mão do fogo.',
            ),
            Concept(
              en: 'Growth (Crescimento)',
              pt: 'Aumentar de tamanho permanentemente',
              desc: 'Living things grow over their lifetime. Growth is permanent.',
              descPt: 'Os seres vivos crescem durante a vida. O crescimento é permanente.',
            ),
            Concept(
              en: 'Reproduction (Reprodução)',
              pt: 'Produzir descendentes',
              desc:
                  'Producing offspring — new individuals. Without reproduction, a species would die out.',
              descPt:
                  'Produzir descendentes — novos indivíduos. Sem reprodução, uma espécie se extinguiria.',
            ),
            Concept(
              en: 'Excretion (Excreção)',
              pt: 'Eliminar resíduos metabólicos',
              desc:
                  'Getting rid of waste products made INSIDE the body by chemical reactions. Sweating and exhaling CO₂ are excretion!',
              descPt:
                  'Eliminar resíduos produzidos DENTRO do corpo por reações químicas. Suar e exalar CO₂ são excreção!',
            ),
            Concept(
              en: 'Nutrition (Nutrição)',
              pt: 'Obter alimentos/energia',
              desc:
                  'Taking in food for energy and growth. Plants make their own food; animals eat other organisms.',
              descPt:
                  'Obter alimento para energia e crescimento. Plantas produzem seu próprio alimento; animais comem outros organismos.',
            ),
            Concept(
              en: 'Virus (Vírus)',
              pt: 'Parasita intracelular obrigatório',
              desc:
                  'Viruses are NOT living — they have no cells and cannot respire alone. They need a host cell to reproduce.',
              descPt:
                  'Vírus NÃO são seres vivos — não possuem células e não conseguem respirar sozinhos. Precisam de uma célula hospedeira para se reproduzir.',
              svg: 'virus',
            ),
            Concept(
              en: 'Host Cell (Célula Hospedeira)',
              pt: 'Célula invadida pelo vírus',
              desc: 'The cell a virus invades and takes over to make copies of itself.',
              descPt: 'A célula que o vírus invade e controla para fazer cópias de si mesmo.',
            ),
          ],
          quiz: [
            Question(
              q: 'Which letter in MRS GREN stands for getting rid of waste?',
              qPt: 'Qual letra em MRS GREN representa eliminação de resíduos?',
              opts: ['R - Respiration', 'E - Excretion', 'N - Nutrition', 'G - Growth'],
              ans: 1,
              exp: 'E = Excretion (Excreção) — removing waste made inside the body.',
              expPt: 'E = Excreção — eliminar resíduos produzidos dentro do corpo.',
            ),
            Question(
              q: 'Why are viruses NOT considered living organisms?',
              qPt: 'Por que vírus NÃO são seres vivos?',
              opts: [
                'They are too small',
                'They have no cells and cannot respire alone',
                'They cannot move',
                'They do not eat'
              ],
              ans: 1,
              exp: 'Viruses have no cells and cannot carry out metabolism on their own.',
              expPt: 'Vírus não possuem células e não realizam metabolismo sozinhos.',
            ),
            Question(
              q: 'A plant turning its leaves towards the sun is an example of...',
              qPt: 'Uma planta voltando folhas para o sol é exemplo de...',
              opts: [
                'Growth (Crescimento)',
                'Nutrition (Nutrição)',
                'Sensitivity (Sensibilidade)',
                'Reproduction (Reprodução)'
              ],
              ans: 2,
              exp: 'Sensitivity — the plant is responding to a stimulus (light).',
              expPt: 'Sensibilidade — a planta reage a um estímulo (luz).',
            ),
            Question(
              q: 'Breathing out CO₂ is an example of which characteristic?',
              qPt: 'Expirar CO₂ é exemplo de qual característica?',
              opts: ['Respiration', 'Excretion', 'Sensitivity', 'Nutrition'],
              ans: 1,
              exp: 'Excretion — CO₂ is a waste product of respiration inside cells.',
              expPt: 'Excreção — CO₂ é resíduo da respiração produzida dentro das células.',
            ),
          ],
        ),

        // ── Module 2: Cell Structure & Functions ───────────────────────────
        Module(
          id: 'cell',
          title: 'Cell Structure & Functions',
          pt: 'Estrutura e Funções Celulares',
          icon: '🔬',
          color: 'tag-blue',
          concepts: [
            Concept(
              en: 'Nucleus (Núcleo)',
              pt: 'Centro de controle da célula',
              desc: 'Contains the DNA — the genetic instructions for the cell. Controls what the cell does.',
              descPt:
                  'Contém o DNA — as instruções genéticas da célula. Controla o que a célula faz.',
              svg: 'nucleus',
            ),
            Concept(
              en: 'Cytoplasm (Citoplasma)',
              pt: 'Substância gelatinosa interna',
              desc: 'Jelly-like fluid that fills the cell. Most chemical reactions happen here.',
              descPt:
                  'Fluido gelatinoso que preenche a célula. A maioria das reações químicas ocorre aqui.',
            ),
            Concept(
              en: 'Mitochondria (Mitocôndria)',
              pt: 'Central energética da célula',
              desc:
                  'Where aerobic respiration happens — releasing energy from food. Known as the "powerhouse of the cell".',
              descPt:
                  'Onde ocorre a respiração aeróbia — liberando energia do alimento. Conhecida como a "usina de energia da célula".',
              svg: 'mito',
            ),
            Concept(
              en: 'Cell Membrane (Membrana Celular)',
              pt: 'Barreira semipermeável',
              desc: 'Controls what enters and leaves the cell. It is selectively permeable.',
              descPt: 'Controla o que entra e sai da célula. É semipermeável.',
            ),
            Concept(
              en: 'Chloroplast (Cloroplasto)',
              pt: 'Organela da fotossíntese — só em plantas',
              desc:
                  'Found ONLY in plant cells. Contains chlorophyll — absorbs sunlight to make food via photosynthesis.',
              descPt:
                  'Encontrado APENAS em células vegetais. Contém clorofila — absorve luz solar para fotossíntese.',
              svg: 'chloro',
            ),
            Concept(
              en: 'Cell Wall (Parede Celular)',
              pt: 'Estrutura rígida — só em plantas',
              desc:
                  'Found ONLY in plant (and fungal) cells. Made of cellulose. Gives the cell a rigid shape.',
              descPt:
                  'Encontrada APENAS em células vegetais e de fungos. Feita de celulose. Dá forma rígida.',
            ),
            Concept(
              en: 'Vacuole (Vacúolo)',
              pt: 'Armazena seiva celular',
              desc:
                  'In plant cells, a large permanent vacuole stores cell sap and keeps the cell firm (turgid).',
              descPt:
                  'Em células vegetais, um grande vacúolo permanente armazena seiva celular e mantém a célula túrgida.',
            ),
            Concept(
              en: 'Animal vs Plant Cell',
              pt: 'Célula Animal vs Vegetal',
              desc:
                  'Plant cells EXTRA features: Cell Wall, Chloroplast, Permanent Vacuole. Animal cells have none of these.',
              descPt:
                  'Células vegetais têm A MAIS: Parede Celular, Cloroplasto, Vacúolo Permanente. Animais não possuem nenhum.',
              svg: 'cells',
            ),
          ],
          quiz: [
            Question(
              q: 'Which organelle is called the "powerhouse of the cell"?',
              qPt: 'Qual organela é chamada de "usina de energia da célula"?',
              opts: [
                'Nucleus (Núcleo)',
                'Chloroplast (Cloroplasto)',
                'Mitochondria (Mitocôndria)',
                'Vacuole (Vacúolo)'
              ],
              ans: 2,
              exp: 'Mitochondria carry out aerobic respiration, releasing energy from food.',
              expPt: 'As mitocôndrias realizam respiração aeróbia, liberando energia do alimento.',
            ),
            Question(
              q: 'Which structures are found in plant cells BUT NOT in animal cells?',
              qPt: 'Quais estruturas estão em células vegetais mas NÃO em animais?',
              opts: [
                'Nucleus and Cytoplasm',
                'Cell Wall, Chloroplast, and large Vacuole',
                'Mitochondria and Membrane',
                'Nucleus and Mitochondria'
              ],
              ans: 1,
              exp: 'Cell Wall, Chloroplasts, and permanent Vacuole are exclusive to plant cells.',
              expPt:
                  'Parede Celular, Cloroplastos e Vacúolo permanente são exclusivos das células vegetais.',
            ),
            Question(
              q: 'What does the cell membrane do?',
              qPt: 'O que a membrana celular faz?',
              opts: [
                'Contains DNA',
                'Makes energy',
                'Controls what enters and exits',
                'Does photosynthesis'
              ],
              ans: 2,
              exp: 'The cell membrane is selectively permeable — controls what enters and leaves.',
              expPt: 'A membrana celular é semipermeável — controla o que entra e sai.',
            ),
            Question(
              q: 'Where does photosynthesis take place?',
              qPt: 'Onde ocorre a fotossíntese?',
              opts: ['Nucleus', 'Mitochondria', 'Cell Wall', 'Chloroplast'],
              ans: 3,
              exp: 'Chloroplasts contain chlorophyll and are where photosynthesis happens.',
              expPt: 'Os cloroplastos contêm clorofila e são onde a fotossíntese ocorre.',
            ),
          ],
        ),

        // ── Module 3: Specialised Cells ────────────────────────────────────
        Module(
          id: 'specialised',
          title: 'Specialised Cells',
          pt: 'Células Especializadas',
          icon: '⚡',
          color: 'tag-purple',
          concepts: [
            Concept(
              en: 'Red Blood Cells (Hemácias)',
              pt: 'Transportam oxigênio no sangue',
              desc:
                  'Biconcave shape — more surface area for oxygen. NO nucleus — more space for haemoglobin.',
              descPt:
                  'Forma bicôncava — mais área de superfície para oxigênio. SEM núcleo — mais espaço para hemoglobina.',
              svg: 'rbc',
            ),
            Concept(
              en: 'Nerve Cells / Neurones (Neurônios)',
              pt: 'Transmitem impulsos elétricos',
              desc:
                  'Very LONG — to send electrical impulses over long distances quickly. Have branching dendrites.',
              descPt:
                  'Muito LONGAS — para enviar impulsos elétricos por longas distâncias. Têm dendritos ramificados.',
              svg: 'nerve',
            ),
            Concept(
              en: 'White Blood Cells (Leucócitos)',
              pt: 'Defendem o corpo de patógenos',
              desc:
                  'Can change shape to engulf (eat) pathogens — phagocytosis. Part of the immune system.',
              descPt:
                  'Podem mudar de forma para engolir patógenos — fagocitose. Fazem parte do sistema imunológico.',
              svg: 'wbc',
            ),
            Concept(
              en: 'Root Hair Cells (Células de Pelo Radicular)',
              pt: 'Absorvem água e sais minerais do solo',
              desc:
                  'Have a long hair-like extension to increase surface area for absorbing water and minerals.',
              descPt:
                  'Têm extensão longa para aumentar a área de superfície para absorção de água e minerais.',
              svg: 'root',
            ),
            Concept(
              en: 'Structure & Function (Estrutura & Função)',
              pt: 'A forma segue a função',
              desc:
                  'KEY CONCEPT: Each cell\'s structure is adapted for its specific function. Always link shape → job!',
              descPt:
                  'CONCEITO-CHAVE: A estrutura de cada célula é adaptada para sua função. Sempre ligue forma → função!',
            ),
          ],
          quiz: [
            Question(
              q: 'Why do red blood cells have no nucleus?',
              qPt: 'Por que as hemácias não têm núcleo?',
              opts: [
                'They are too small',
                'To create more space for haemoglobin',
                'They lost it when infected',
                'To move faster'
              ],
              ans: 1,
              exp: 'No nucleus = more space for haemoglobin to carry oxygen. Structure adapted for function!',
              expPt: 'Sem núcleo = mais espaço para hemoglobina transportar oxigênio.',
            ),
            Question(
              q: 'Which cell has a very long shape and sends electrical signals?',
              qPt: 'Qual célula tem formato muito longo e envia sinais elétricos?',
              opts: [
                'Root Hair Cell',
                'White Blood Cell',
                'Nerve Cell / Neurone',
                'Red Blood Cell'
              ],
              ans: 2,
              exp: 'Nerve cells are long to send electrical impulses quickly across the body.',
              expPt: 'As células nervosas são longas para enviar impulsos elétricos rapidamente.',
            ),
            Question(
              q: 'What is the advantage of the long extension on root hair cells?',
              qPt: 'Qual é a vantagem da extensão longa nas células radiculares?',
              opts: [
                'They can move in soil',
                'Increased surface area to absorb water',
                'They contain chlorophyll',
                'They send signals to leaves'
              ],
              ans: 1,
              exp: 'The extension increases surface area, allowing more water and minerals to be absorbed.',
              expPt:
                  'A extensão aumenta a área de superfície para maior absorção de água e minerais.',
            ),
            Question(
              q: 'White blood cells fight disease by...',
              qPt: 'Os leucócitos combatem doenças...',
              opts: [
                'Carrying oxygen',
                'Changing shape to engulf pathogens',
                'Making chlorophyll',
                'Sending nerve signals'
              ],
              ans: 1,
              exp: 'White blood cells use phagocytosis — they change shape to engulf and destroy pathogens.',
              expPt: 'Leucócitos usam fagocitose — mudam de forma para engolir e destruir patógenos.',
            ),
          ],
        ),

        // ── Module 4: Levels of Organisation ──────────────────────────────
        Module(
          id: 'levels',
          title: 'Levels of Organisation',
          pt: 'Níveis de Organização',
          icon: '🏗️',
          color: 'tag-amber',
          concepts: [
            Concept(
              en: 'Cell (Célula)',
              pt: 'Unidade básica da vida',
              desc: 'The smallest unit of life. Everything starts here!',
              descPt: 'A menor unidade da vida. Tudo começa aqui!',
              svg: 'levels',
            ),
            Concept(
              en: 'Tissue (Tecido)',
              pt: 'Grupo de células similares',
              desc:
                  'A group of similar cells working together for the same function. Example: muscle tissue.',
              descPt:
                  'Um grupo de células similares trabalhando juntas. Exemplo: tecido muscular.',
            ),
            Concept(
              en: 'Organ (Órgão)',
              pt: 'Diferentes tecidos trabalhando juntos',
              desc:
                  'Different tissues working together to carry out a function. Example: Heart (Coração).',
              descPt:
                  'Tecidos diferentes trabalhando juntos para realizar uma função. Exemplo: Coração.',
            ),
            Concept(
              en: 'Organ System (Sistema de Órgãos)',
              pt: 'Órgãos que cooperam',
              desc:
                  'Organs working together as a system. Example: Digestive System (Sistema Digestório).',
              descPt:
                  'Órgãos trabalhando juntos. Exemplo: Sistema Digestório (estômago + intestinos + fígado).',
            ),
            Concept(
              en: 'Organism (Organismo)',
              pt: 'O ser vivo completo',
              desc: 'All organ systems working together — the complete living thing.',
              descPt: 'Todos os sistemas de órgãos trabalhando juntos — o ser vivo completo.',
            ),
          ],
          quiz: [
            Question(
              q: 'What is a TISSUE?',
              qPt: 'O que é um TECIDO?',
              opts: [
                'A single cell',
                'A group of similar cells working together',
                'Different organs in one system',
                'A complete organism'
              ],
              ans: 1,
              exp: 'Tissue = group of similar cells with the same function.',
              expPt: 'Tecido = grupo de células similares com a mesma função.',
            ),
            Question(
              q: 'Put in order from smallest to largest: Organ, Cell, Organism, Tissue, Organ System',
              qPt: 'Ordene do menor ao maior: Órgão, Célula, Organismo, Tecido, Sistema',
              opts: [
                'Cell → Tissue → Organ → Organ System → Organism',
                'Organism → Cell → Tissue → Organ → Organ System',
                'Cell → Organ → Tissue → Organism → Organ System',
                'Tissue → Cell → Organ → Organism → Organ System'
              ],
              ans: 0,
              exp: 'Cell → Tissue → Organ → Organ System → Organism is the correct ascending order!',
              expPt:
                  'Célula → Tecido → Órgão → Sistema de Órgãos → Organismo é a ordem correta!',
            ),
            Question(
              q: 'The heart (coração) is an example of an...',
              qPt: 'O coração é um exemplo de...',
              opts: [
                'Cell (Célula)',
                'Tissue (Tecido)',
                'Organ (Órgão)',
                'Organism (Organismo)'
              ],
              ans: 2,
              exp: 'The heart is an organ — made of different tissues working together.',
              expPt: 'O coração é um órgão — formado por tecidos diferentes trabalhando juntos.',
            ),
            Question(
              q: 'The digestive system is an example of an...',
              qPt: 'O sistema digestório é um exemplo de...',
              opts: [
                'Organ (Órgão)',
                'Organ System (Sistema de Órgãos)',
                'Tissue (Tecido)',
                'Organism (Organismo)'
              ],
              ans: 1,
              exp: 'Organ System — many organs working together to digest food.',
              expPt: 'Sistema de Órgãos — muitos órgãos trabalhando juntos para digerir o alimento.',
            ),
          ],
        ),

        // ── Module 5: Microorganisms & Ecology ─────────────────────────────
        Module(
          id: 'ecology',
          title: 'Microorganisms & Ecology',
          pt: 'Microrganismos e Ecologia',
          icon: '🌿',
          color: 'tag-coral',
          concepts: [
            Concept(
              en: 'Producers (Produtores)',
              pt: 'Fazem o próprio alimento',
              desc:
                  'Organisms that make their own food using sunlight — plants, algae, phytoplankton. Always FIRST in a food chain.',
              descPt:
                  'Organismos que produzem o próprio alimento usando luz solar. Sempre os PRIMEIROS na cadeia alimentar.',
              svg: 'foodchain',
            ),
            Concept(
              en: 'Consumers (Consumidores)',
              pt: 'Comem outros organismos',
              desc:
                  'Organisms that eat other organisms. Primary consumers eat plants; secondary consumers eat primary consumers.',
              descPt:
                  'Organismos que comem outros. Consumidores primários comem plantas; secundários comem primários.',
            ),
            Concept(
              en: 'Decomposers (Decompositores)',
              pt: 'Decompõem matéria morta',
              desc:
                  'Break down dead organisms and recycle nutrients back into the soil. Main decomposers: Bacteria and Fungi!',
              descPt:
                  'Decompõem organismos mortos e reciclam nutrientes no solo. Principais: Bactérias e Fungos!',
            ),
            Concept(
              en: 'Food Chain (Cadeia Alimentar)',
              pt: 'Caminho da energia',
              desc:
                  'Shows how energy flows from one organism to another. Always: Producer → Primary Consumer → Secondary Consumer.',
              descPt:
                  'Mostra como a energia flui. Sempre: Produtor → Consumidor Primário → Consumidor Secundário.',
            ),
            Concept(
              en: 'Food Web (Teia Alimentar)',
              pt: 'Várias cadeias interligadas',
              desc:
                  'Many food chains linked together. More realistic — most animals eat more than one thing.',
              descPt:
                  'Várias cadeias alimentares interligadas. Mais realista — a maioria dos animais come mais de uma coisa.',
            ),
            Concept(
              en: 'Bacteria & Fungi (Bactérias e Fungos)',
              pt: 'Os grandes decompositores',
              desc:
                  'Microorganisms that are essential decomposers. They break down dead matter, releasing nutrients for plants.',
              descPt:
                  'Microrganismos decompositores essenciais. Decompõem matéria morta, liberando nutrientes para as plantas.',
            ),
          ],
          quiz: [
            Question(
              q: 'Which organisms are ALWAYS at the START of a food chain?',
              qPt: 'Quais organismos estão SEMPRE no INÍCIO da cadeia alimentar?',
              opts: [
                'Decomposers (Decompositores)',
                'Consumers (Consumidores)',
                'Producers (Produtores)',
                'Carnivores (Carnívoros)'
              ],
              ans: 2,
              exp: 'Producers (plants, algae) make their own food from sunlight — always the first link.',
              expPt:
                  'Produtores (plantas, algas) produzem o próprio alimento da luz solar — sempre o primeiro elo.',
            ),
            Question(
              q: 'What is the role of decomposers?',
              qPt: 'Qual é o papel dos decompositores?',
              opts: [
                'Eat primary consumers',
                'Make food from sunlight',
                'Break down dead matter and recycle nutrients',
                'Transport oxygen'
              ],
              ans: 2,
              exp: 'Decomposers (bacteria and fungi) break down dead organisms and return nutrients to the soil.',
              expPt:
                  'Decompositores decompõem organismos mortos e devolvem nutrientes ao solo.',
            ),
            Question(
              q: 'What is the main difference between a food chain and a food web?',
              qPt: 'Qual a diferença entre cadeia e teia alimentar?',
              opts: [
                'Food webs have producers; chains do not',
                'Food webs are many linked chains; chains show one path',
                'Chains show decomposers; webs do not',
                'They are the same thing'
              ],
              ans: 1,
              exp: 'A food web is multiple food chains linked together — more realistic.',
              expPt: 'Uma teia alimentar é várias cadeias interligadas — mais realista.',
            ),
            Question(
              q: 'Bacteria and Fungi are important because they are...',
              qPt: 'Bactérias e Fungos são importantes porque são...',
              opts: [
                'Primary consumers',
                'Top predators',
                'Decomposers that recycle nutrients',
                'Producers of oxygen only'
              ],
              ans: 2,
              exp: 'Bacteria and Fungi are the main decomposers — without them nutrients would not be recycled.',
              expPt:
                  'Bactérias e Fungos são os principais decompositores — sem eles os nutrientes não seriam reciclados.',
            ),
          ],
        ),
      ];

  static List<GlossaryEntry> getGlossary() => const [
        GlossaryEntry('MRS GREN', 'MRS GREN',
            'Acronym for the 7 life characteristics (acrônimo para as 7 características da vida).'),
        GlossaryEntry('Virus (Vírus)', 'Vírus',
            'Acellular parasite; needs a host cell (parasita acelular; precisa de célula hospedeira).'),
        GlossaryEntry('Nucleus (Núcleo)', 'Núcleo',
            'Contains DNA; controls the cell (contém DNA; controla a célula).'),
        GlossaryEntry('Mitochondria (Mitocôndria)', 'Mitocôndria',
            'Releases energy via respiration (libera energia por respiração).'),
        GlossaryEntry('Chloroplast (Cloroplasto)', 'Cloroplasto',
            'Plant only; does photosynthesis (só em plantas; realiza fotossíntese).'),
        GlossaryEntry('Cell Wall (Parede Celular)', 'Parede Celular',
            'Plant/fungi only; rigid support (só em plantas/fungos; suporte rígido).'),
        GlossaryEntry('Vacuole (Vacúolo)', 'Vacúolo',
            'Stores cell sap; keeps plant cells firm (armazena seiva; mantém célula túrgida).'),
        GlossaryEntry('Red Blood Cell (Hemácia)', 'Hemácia',
            'No nucleus; carries O₂ via haemoglobin (sem núcleo; transporta O₂).'),
        GlossaryEntry('Neurone (Neurônio)', 'Neurônio',
            'Long cell; sends electrical impulses (célula longa; envia impulsos elétricos).'),
        GlossaryEntry('White Blood Cell (Leucócito)', 'Leucócito',
            'Engulfs pathogens via phagocytosis (fagocitose).'),
        GlossaryEntry('Root Hair Cell', 'Célula de Pelo Radicular',
            'Long extension; absorbs water from soil (extensão longa; absorve água).'),
        GlossaryEntry(
            'Tissue (Tecido)', 'Tecido', 'Group of similar cells (grupo de células similares).'),
        GlossaryEntry('Organ (Órgão)', 'Órgão',
            'Different tissues working together (tecidos diferentes trabalhando juntos).'),
        GlossaryEntry('Organ System', 'Sistema de Órgãos',
            'Organs working together e.g. digestive system (órgãos trabalhando juntos).'),
        GlossaryEntry('Producer (Produtor)', 'Produtor',
            'Makes own food from sunlight (produz alimento da luz solar).'),
        GlossaryEntry('Consumer (Consumidor)', 'Consumidor',
            'Eats other organisms (come outros organismos).'),
        GlossaryEntry('Decomposer (Decompositor)', 'Decompositor',
            'Breaks down dead matter; bacteria & fungi (decompõe matéria morta).'),
        GlossaryEntry('Food Web (Teia Alimentar)', 'Teia Alimentar',
            'Many linked food chains (várias cadeias alimentares interligadas).'),
        GlossaryEntry('Haemoglobin (Hemoglobina)', 'Hemoglobina',
            'Protein in red blood cells that carries oxygen (proteína que transporta oxigênio).'),
        GlossaryEntry('Phagocytosis (Fagocitose)', 'Fagocitose',
            'White blood cells engulfing pathogens (leucócitos engolindo patógenos).'),
      ];

  static List<GameZone> getGameZones() => const [
        GameZone(
          id: 'blood',
          name: 'Bloodstream',
          pt: 'Corrente Sanguínea',
          intro: 'You are floating through the bloodstream! Strange cells surround you...',
          introPt: 'Você está flutuando pela corrente sanguínea! Células estranhas te cercam...',
          svgId: 'blood_svg',
          q: 'This red biconcave cell has no nucleus. What is it?',
          qPt: 'Esta célula vermelha bicôncava não tem núcleo. O que é ela?',
          opts: [
            'White Blood Cell (Leucócito)',
            'Red Blood Cell (Hemácia)',
            'Nerve Cell (Neurônio)',
            'Root Hair Cell'
          ],
          ans: 1,
          feedback:
              'Correct! Red Blood Cells (Hemácias) have no nucleus — more space for haemoglobin (hemoglobina) to carry oxygen (oxigênio)!',
          feedbackPt:
              'Correto! Hemácias não têm núcleo — mais espaço para hemoglobina transportar oxigênio!',
          evidenceItem: 'Red blood cells detected — haemoglobin normal. Host is alive!',
        ),
        GameZone(
          id: 'immune',
          name: 'Immune Defense',
          pt: 'Defesa Imunológica',
          intro: 'Alert! You see a large irregular cell chasing something...',
          introPt: 'Alerta! Você vê uma célula grande e irregular perseguindo algo...',
          svgId: 'immune_svg',
          q: 'This cell changes shape to engulf (eat) pathogens. What is this process called?',
          qPt: 'Esta célula muda de forma para engolir patógenos. Como se chama esse processo?',
          opts: [
            'Photosynthesis (Fotossíntese)',
            'Respiration (Respiração)',
            'Phagocytosis (Fagocitose)',
            'Excretion (Excreção)'
          ],
          ans: 2,
          feedback:
              'Correct! White Blood Cells (Leucócitos) use phagocytosis (fagocitose) to destroy pathogens!',
          feedbackPt: 'Correto! Leucócitos usam fagocitose para destruir patógenos!',
          evidenceItem:
              'White blood cells active — immune response triggered. Something is being fought!',
        ),
        GameZone(
          id: 'cell',
          name: 'Cell Interior',
          pt: 'Interior da Célula',
          intro: 'You just got shrunk even more and are INSIDE a cell! Identify the organelles!',
          introPt:
              'Você ficou ainda menor e está DENTRO de uma célula! Identifique as organelas!',
          svgId: 'cell_svg',
          q: 'Which organelle releases energy from food (respiration)?',
          qPt: 'Qual organela libera energia do alimento (respiração)?',
          opts: [
            'Nucleus (Núcleo)',
            'Cell Wall (Parede Celular)',
            'Mitochondria (Mitocôndria)',
            'Vacuole (Vacúolo)'
          ],
          ans: 2,
          feedback:
              'Correct! Mitochondria (Mitocôndrias) are the powerhouse — they carry out respiration to release energy!',
          feedbackPt:
              'Correto! Mitocôndrias são a usina de energia — realizam respiração para liberar energia!',
          evidenceItem: 'High mitochondrial activity detected — cells working overtime!',
        ),
        GameZone(
          id: 'lungs',
          name: 'Lung Tissue',
          pt: 'Tecido Pulmonar',
          intro: 'You are in the lungs — and you can see tiny invaders replicating inside cells!',
          introPt:
              'Você está nos pulmões — e pode ver pequenos invasores se replicando dentro de células!',
          svgId: 'lung_svg',
          q: 'The invader has NO cells and needs a host cell to reproduce. What is it?',
          qPt:
              'O invasor NÃO tem células e precisa de célula hospedeira para se reproduzir. O que é?',
          opts: [
            'Bacterium (Bactéria)',
            'Fungus (Fungo)',
            'Virus (Vírus)',
            'White Blood Cell'
          ],
          ans: 2,
          feedback:
              'Correct! Viruses (Vírus) are acellular — no cells! They invade host cells to replicate. THIS is causing the cold!',
          feedbackPt:
              'Correto! Vírus são acelulares! Invadem células hospedeiras para se replicar. ISSO causa o resfriado!',
          evidenceItem:
              'VIRUS identified in lung tissue — invading host cells! Cold confirmed!',
        ),
        GameZone(
          id: 'ecology',
          name: 'Ecosystem Exit',
          pt: 'Saída pelo Ecossistema',
          intro:
              'To escape, you must pass through the body\'s ecosystem of microorganisms in the gut!',
          introPt:
              'Para escapar, você deve passar pelo ecossistema de microrganismos no intestino!',
          svgId: 'eco_svg',
          q: 'Bacteria and Fungi in the gut are important because they are...',
          qPt:
              'Bactérias e Fungos no intestino são importantes porque são...',
          opts: [
            'Top predators (Predadores)',
            'Producers (Produtores)',
            'Decomposers that recycle matter (Decompositores)',
            'Primary consumers (Consumidores primários)'
          ],
          ans: 2,
          feedback:
              'Correct! Bacteria and Fungi are Decomposers (Decompositores) — they break down matter and recycle nutrients! You found the exit!',
          feedbackPt:
              'Correto! Bactérias e Fungos são Decompositores — decompõem matéria e reciclam nutrientes! Você encontrou a saída!',
          evidenceItem:
              'Gut microbiome analyzed — decomposers active. Mission complete!',
        ),
      ];
}

