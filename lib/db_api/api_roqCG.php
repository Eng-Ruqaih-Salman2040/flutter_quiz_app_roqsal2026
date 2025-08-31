<?php
header("Content-Type: application/json");

// Database credentials
$host = 'localhost';
$db   = 'quiz_api_roq_db';  // your database name
$user = 'root';
$pass = ''; // adjust if you set a password
$charset = 'utf8mb4';

$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
];

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=$charset", $user, $pass, $options);
} catch (\PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Database connection failed.']);
    exit;
}

// Input params
$amount = isset($_GET['amount']) ? (int)$_GET['amount'] : 10;
$categoryId = isset($_GET['category']) ? (int)$_GET['category'] : null;
$difficulty = isset($_GET['difficulty']) ? $_GET['difficulty'] : null;

if (!$categoryId || !$difficulty || !$amount) {
    echo json_encode(['response_code' => 1, 'error' => 'Missing parameters.']);
    exit;
}

// Fetch questions
$sql = "
    SELECT 
        q.id,
        qt.type_name AS type,
        d.level_name AS difficulty,
        c.name AS category,
        q.question_text AS question,
        a.answer_a, a.answer_b, a.answer_c, a.answer_d, a.answer_e, a.answer_f,
        ca.answer_a_correct, ca.answer_b_correct, ca.answer_c_correct, 
        ca.answer_d_correct, ca.answer_e_correct, ca.answer_f_correct
    FROM questions q
    JOIN categories c ON q.category_id = c.id
    JOIN question_types qt ON q.type_id = qt.id
    JOIN difficulties d ON q.difficulty_id = d.id
    JOIN answers a ON a.question_id = q.id
    JOIN correct_answers ca ON ca.question_id = q.id
    WHERE q.category_id = :categoryId AND d.level_name = :difficulty
    ORDER BY RAND()
    LIMIT :amount
";

$stmt = $pdo->prepare($sql);
$stmt->bindValue(':categoryId', $categoryId, PDO::PARAM_INT);
$stmt->bindValue(':difficulty', $difficulty, PDO::PARAM_STR);
$stmt->bindValue(':amount', $amount, PDO::PARAM_INT);
$stmt->execute();

$questions = $stmt->fetchAll();

$results = [];

foreach ($questions as $q) {
    $all_answers = [];
    $correct_answer = '';
    $incorrect_answers = [];

    // Collect available answers
    $answers = [
        'answer_a' => $q['answer_a'],
        'answer_b' => $q['answer_b'],
        'answer_c' => $q['answer_c'],
        'answer_d' => $q['answer_d'],
        'answer_e' => $q['answer_e'],
        'answer_f' => $q['answer_f']
    ];

    $correct_flags = [
        'answer_a' => $q['answer_a_correct'],
        'answer_b' => $q['answer_b_correct'],
        'answer_c' => $q['answer_c_correct'],
        'answer_d' => $q['answer_d_correct'],
        'answer_e' => $q['answer_e_correct'],
        'answer_f' => $q['answer_f_correct']
    ];

    foreach ($answers as $key => $val) {
        if ($val !== null) {
            if ($correct_flags[$key] === 'true') {
                $correct_answer = $val;
            } else {
                $incorrect_answers[] = $val;
            }
        }
    }

    $results[] = [
        'type' => $q['type'] === 'boolean' ? 'boolean' : 'multiple',
        'difficulty' => $q['difficulty'],
        'category' => $q['category'],
        'question' => htmlspecialchars_decode($q['question']),
        'correct_answer' => $correct_answer,
        'incorrect_answers' => $incorrect_answers
    ];
}

$response = [
    'response_code' => 0,
    'results' => $results
];

echo json_encode($response, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
?>
