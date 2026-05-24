USE `blog`;

INSERT INTO `categories` (`title`, `description`, `slug`) VALUES
('Technology',     'Articles about software development, programming languages, and modern tech trends.',       'technology'),
('Design',         'Insights on UI/UX design, typography, color theory, and creative processes.',               'design'),
('Business',       'Entrepreneurship, startups, productivity hacks, and career development.',                   'business'),
('Science',        'Discoveries, research breakthroughs, space exploration, and the natural world.',            'science'),
('Health & Life',  'Tips on mental health, fitness, nutrition, and building better daily habits.',              'health-life');

INSERT INTO `articles` (`title`, `description`, `text`, `image`, `slug`, `views`, `published_at`) VALUES
(
    'Getting Started with PHP 8.1',
    'An overview of the exciting new features introduced in PHP 8.1 and how they improve your code quality.',
    '<p>PHP 8.1 introduced several powerful features that make writing modern PHP a pleasure. Among the most notable additions are <strong>Enums</strong>, <strong>Fibers</strong>, and <strong>readonly properties</strong>.</p><p>Enums allow you to define a set of possible values for a type, making your code more expressive and less error-prone. Fibers provide a mechanism for creating lightweight cooperative concurrency. Readonly properties let you declare properties that can only be initialized once.</p><p>These features together push PHP closer to the expressiveness of languages like Rust and Kotlin, while keeping PHP\'s approachable syntax.</p><h2>Enums Example</h2><pre><code>enum Status {\n  case Active;\n  case Inactive;\n  case Pending;\n}</code></pre><p>With backed enums you can also assign scalar values to each case, making serialization straightforward.</p>',
    null,
    'getting-started-php-81',
    1240,
    '2024-01-10 09:00:00'
),
(
    'MySQL Indexing Best Practices',
    'Learn how to design efficient indexes in MySQL to dramatically speed up your queries.',
    '<p>Proper indexing is one of the most impactful optimizations you can apply to a MySQL database. An index allows MySQL to find rows without scanning the entire table.</p><p><strong>Composite indexes</strong> are particularly powerful: the order of columns matters — MySQL can use the index for queries that filter on the leftmost columns.</p><p>Use <code>EXPLAIN</code> to inspect query plans and identify missing or unused indexes. Watch out for low-cardinality columns (like boolean flags) where a full table scan may actually be cheaper.</p><p>Remember: indexes speed up reads but slow down writes. Only index columns you actually query on.</p>',
    null,
    'mysql-indexing-best-practices',
    875,
    '2024-01-18 11:30:00'
),
(
    'Clean Code Principles Every Developer Should Know',
    'Timeless software engineering principles that will make your codebase maintainable for years.',
    '<p>Writing clean code is a craft. Robert C. Martin\'s principles give us a vocabulary to talk about code quality.</p><p><strong>Single Responsibility Principle</strong> states that a class should have only one reason to change. When a class handles too many concerns, changes ripple unpredictably.</p><p><strong>DRY (Don\'t Repeat Yourself)</strong> encourages extracting duplicated logic into reusable functions or classes. Every piece of knowledge should have a single, authoritative representation.</p><p><strong>Meaningful names</strong> are perhaps the simplest and most impactful improvement. A well-named variable explains <em>what</em> it holds; a well-named function explains <em>what</em> it does.</p>',
    null,
    'clean-code-principles',
    2103,
    '2024-02-05 14:00:00'
),
(
    'Understanding UI Color Theory',
    'How to choose color palettes that create harmony, hierarchy, and emotion in your designs.',
    '<p>Color is one of the most powerful tools in a designer\'s arsenal. It communicates mood before the user reads a single word.</p><p>The <strong>60-30-10 rule</strong> is a classic guideline: 60% dominant color, 30% secondary color, and 10% accent. This creates visual balance without monotony.</p><p>Understanding color psychology matters too. Blue conveys trust and stability — hence its prevalence in finance and tech. Red triggers urgency and excitement. Green signals safety, growth, and nature.</p><p>For digital interfaces, always verify contrast ratios against WCAG guidelines to ensure accessibility for users with visual impairments.</p>',
    null,
    'understanding-ui-color-theory',
    643,
    '2024-02-12 10:15:00'
),
(
    'Typography Fundamentals for Web',
    'Master the basics of typefaces, hierarchy, spacing, and readability for web design.',
    '<p>Typography is the backbone of communication on the web. Poor typographic choices can make even the most beautiful layout feel amateur.</p><p>Start with a clear <strong>type scale</strong>: define heading sizes from H1 to H6 with consistent ratios (e.g., 1.25 or the Major Third scale). This creates predictable visual hierarchy.</p><p><strong>Line height</strong> (leading) dramatically affects readability. For body text, 1.5–1.6× the font size is a solid starting point. Tight line heights feel dense; too loose feels disconnected.</p><p>Limit yourself to two or three typefaces per project. One for headings, one for body, and optionally one for monospace code blocks.</p>',
    null,
    'typography-fundamentals-web',
    512,
    '2024-03-01 08:45:00'
),
(
    'Building a Startup: Lessons from the Trenches',
    'Real-world advice from founders who have navigated the chaotic early stages of building a company.',
    '<p>Starting a company is equal parts exhilarating and terrifying. The clichés are all true: it is a rollercoaster, and you will question yourself constantly.</p><p>One of the most dangerous traps is <strong>premature scaling</strong>. Founders often want to hire aggressively and build elaborate systems before validating their core assumptions. Resist this urge. Do things that don\'t scale first.</p><p><strong>Talk to your customers obsessively.</strong> The product you imagine customers want and the product they actually need are usually different. Regular user interviews surface this gap early, when course correction is cheap.</p><p>Maintain a tight feedback loop: build → measure → learn. Every week you spend building without shipping is a week of feedback you\'re missing.</p>',
    null,
    'building-startup-lessons',
    1580,
    '2024-03-10 13:00:00'
),
(
    'Remote Work Productivity Playbook',
    'Proven strategies and tools for staying focused, energized, and connected while working from home.',
    '<p>Remote work promises freedom, but without structure it quickly becomes chaos. The professionals who thrive remotely treat their environment and schedule with the same intentionality they would a physical office.</p><p><strong>Dedicated workspace</strong> is non-negotiable. Even a specific corner of a room signals to your brain that it is time to work. When you close the laptop and leave that space, work is done.</p><p><strong>Time blocking</strong> — scheduling specific hours for specific tasks — dramatically reduces decision fatigue. Reserve your peak cognitive hours for deep work and meetings for low-energy periods.</p><p>Overcommunicate asynchronously. Write down decisions, share context proactively, and use tools like Notion or Confluence to create a shared source of truth.</p>',
    null,
    'remote-work-productivity-playbook',
    934,
    '2024-03-22 09:30:00'
),
(
    'James Webb Telescope: A Year of Discoveries',
    'Highlights from the first full year of science from the most powerful space telescope ever built.',
    '<p>The James Webb Space Telescope has transformed our understanding of the cosmos in ways that even its designers dared not promise. Its infrared sensitivity reveals structures invisible to Hubble.</p><p>Among its most striking early results: images of galaxies just <strong>300–400 million years after the Big Bang</strong> — far older and more structured than models predicted. This is forcing cosmologists to revisit assumptions about early star formation.</p><p>Webb has also characterized the atmospheres of exoplanets with unprecedented precision, detecting carbon dioxide in the atmosphere of WASP-39b — a milestone in the search for potentially habitable worlds.</p><p>Each data release triggers a cascade of papers. The telescope\'s archive is already one of the most productive in the history of astronomy.</p>',
    null,
    'james-webb-telescope-discoveries',
    2450,
    '2024-04-05 16:00:00'
),
(
    'The Science of Sleep and Peak Performance',
    'What neuroscience tells us about optimizing sleep for memory, creativity, and athletic performance.',
    '<p>Sleep is not downtime. It is when the brain consolidates memories, flushes metabolic waste via the glymphatic system, and repairs cellular damage. Skimping on it extracts a compounding cognitive debt.</p><p>The optimal amount for most adults is 7–9 hours. But <strong>timing</strong> matters as much as duration. Sleeping in sync with your circadian rhythm — going to bed and waking at consistent times — maximizes the proportion of restorative slow-wave and REM sleep you get.</p><p>Practical interventions: keep your bedroom cool (16–19°C), avoid screens an hour before bed (blue light suppresses melatonin), and limit caffeine after 2 PM. These changes compound quickly.</p>',
    null,
    'science-of-sleep-performance',
    1890,
    '2024-04-18 07:00:00'
),
(
    'Building Habits That Actually Stick',
    'The psychology behind habit formation and evidence-based strategies to make new behaviors automatic.',
    '<p>Most habit-change attempts fail not because of willpower, but because of poor system design. James Clear\'s habit loop framework — cue, craving, response, reward — gives us a map for engineering behavior change.</p><p>The key insight is to make desired behaviors <strong>obvious, attractive, easy, and satisfying</strong> (OAES). Conversely, to break bad habits, make them invisible, unattractive, difficult, and unsatisfying.</p><p><strong>Habit stacking</strong> — anchoring a new behavior to an existing one — is particularly effective: "After I pour my morning coffee, I will write three sentences in my journal." The existing habit serves as a reliable cue.</p><p>Track streaks visually. The simple act of marking a calendar creates a reward loop and makes the cost of breaking the chain psychologically painful.</p>',
    null,
    'building-habits-that-stick',
    1320,
    '2024-05-01 10:00:00'
);

-- Article ↔ Category relationships
INSERT INTO `article_categories` (`article_id`, `category_id`) VALUES
(1, 1),  -- PHP 8.1 → Technology
(2, 1),  -- MySQL → Technology
(3, 1),  -- Clean Code → Technology
(4, 2),  -- Color Theory → Design
(5, 2),  -- Typography → Design
(6, 3),  -- Startup → Business
(7, 3),  -- Remote Work → Business
(8, 4),  -- Webb Telescope → Science
(9, 4),  -- Sleep Science → Science
(9, 5),  -- Sleep → also Health & Life
(10, 5), -- Habits → Health & Life
(3, 2);  -- Clean Code → also Design (code readability)
