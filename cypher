// ============================================
// MLoG-GenAI KNOWLEDGE GRAPH - COMPLETE SCRIPT
// ============================================

// 1. CLEAR EXISTING DATA
MATCH (n) DETACH DELETE n;

// 2. CREATE WORKSHOP AND CONFERENCE
CREATE (w:Workshop {
  name: "MLoG-GenAI",
  full_name: "International Workshop on Machine Learning on Graphs in the Era of Generative AI",
  year: 2025,
  description: "A venue to gather academic researchers and industry practitioners to discuss GML in the Gen-AI era"
});

CREATE (c:Conference {
  name: "ACM KDD",
  full_name: "ACM Conference on Knowledge Discovery and Data Mining",
  edition: 31,
  year: 2025
});

MATCH (w:Workshop {name: "MLoG-GenAI"})
MATCH (c:Conference {name: "ACM KDD"})
CREATE (w)-[:HELD_AT]->(c);

// 3. CREATE GML TECHNOLOGY EVOLUTION
CREATE (gml:Technology:Concept {
  name: "Graph Machine Learning",
  type: "Field",
  description: "Automates knowledge discovery and decision-making on graphs"
});

CREATE (shallow:Technology {
  name: "Shallow Embedding Models",
  era: "Early",
  description: "Early techniques for learning node representations"
});

CREATE (gnn:Technology {
  name: "Graph Neural Networks",
  era: "Modern",
  description: "Process graph structure through neural networks"
});

CREATE (transformer:Technology {
  name: "Graph Transformers",
  era: "Advanced",
  description: "Most powerful models capturing global context"
});

CREATE (genai:Technology:Concept {
  name: "Generative AI",
  type: "Revolution",
  description: "Large foundational models driving new era of Gen-AI"
});

MATCH (s:Technology {name: "Shallow Embedding Models"})
MATCH (g:Technology {name: "Graph Neural Networks"})
MATCH (t:Technology {name: "Graph Transformers"})
CREATE (s)-[:EVOLVED_TO]->(g)
CREATE (g)-[:EVOLVED_TO]->(t);

// 4. CREATE APPLICATIONS
CREATE (app1:Application {
  name: "Social Networks",
  description: "Model friendships and information spread"
});

CREATE (app2:Application {
  name: "Drug Discovery",
  description: "Model molecular structures"
});

CREATE (app3:Application {
  name: "Recommendation Systems",
  description: "Model user-item interactions"
});

// 5. CREATE COMMUNITIES
CREATE (researchers:Community {
  name: "Academic Researchers",
  role: "Research and development"
});

CREATE (practitioners:Community {
  name: "Industry Practitioners",
  role: "Real-world application"
});

// 6. CREATE GML MECHANISMS
CREATE (mp:Concept:Mechanism {
  name: "Message Passing",
  category: "GNN Mechanism",
  description: "Core mechanism for GNNs where nodes aggregate information from neighbors"
});

CREATE (att:Concept:Mechanism {
  name: "Attention Mechanism",
  category: "Transformer Mechanism",
  description: "Used in Graph Transformers to capture global importance"
});

CREATE (pos:Concept:Mechanism {
  name: "Positional Encodings",
  category: "Transformer Mechanism",
  description: "Add node position awareness for Transformers"
});

// 7. CREATE GML TASKS
CREATE (task1:Task {
  name: "Node Classification",
  category: "Prediction Task"
});

CREATE (task2:Task {
  name: "Link Prediction",
  category: "Prediction Task"
});

CREATE (task3:Task {
  name: "Graph Generation",
  category: "Generation Task"
});

// 8. CREATE CHALLENGES
CREATE (ch_genai:Challenge {
  name: "Gen-AI Challenges for GML",
  examples: ["Integrating graph structure into LLMs", "Ensuring generated graphs are accurate", "High computational cost"]
});

CREATE (os:Challenge:Technical {
  name: "Oversmoothing",
  description: "Nodes become too similar after many layers"
});

CREATE (oq:Challenge:Technical {
  name: "Oversquashing",
  description: "Information bottleneck in graph bottlenecks"
});

CREATE (sc:Challenge:Technical {
  name: "Scalability Issues",
  description: "Difficulty scaling to large graphs"
});

CREATE (op:Opportunity {
  name: "Gen-AI Opportunities for GML",
  examples: ["Generate realistic graph data", "Automate complex reasoning", "Create new molecules"]
});

// 9. CREATE GEN-AI APPLICATIONS
CREATE (llmkg:Concept:GenAI_Application {
  name: "LLM-Assisted Knowledge Graph Construction",
  category: "GenAI + GML",
  description: "Using LLMs to extract entities and relations"
});

CREATE (hybrid:Concept:GenAI_Application {
  name: "LLM-GNN Hybrid Models",
  category: "GenAI + GML",
  description: "Combine structured reasoning with language understanding"
});

CREATE (gp:Concept:GenAI_Application {
  name: "Graph Prompting",
  category: "GenAI + GML",
  description: "Designing graph-structured prompts for LLMs"
});

// ============================================
// CONNECT ALL RELATIONSHIPS
// ============================================

// 10. CONNECT WORKSHOP RELATIONSHIPS
MATCH (w:Workshop {name: "MLoG-GenAI"})
MATCH (g:Concept {name: "Graph Machine Learning"})
MATCH (gen:Concept {name: "Generative AI"})
MATCH (res:Community {name: "Academic Researchers"})
MATCH (prac:Community {name: "Industry Practitioners"})

CREATE (w)-[:DISCUSSES]->(g)
CREATE (w)-[:DISCUSSES]->(gen)
CREATE (w)-[:BRINGS_TOGETHER]->(res)
CREATE (w)-[:BRINGS_TOGETHER]->(prac);

// 11. CONNECT GML APPLICATIONS
MATCH (g:Concept {name: "Graph Machine Learning"})
MATCH (app1:Application {name: "Social Networks"})
MATCH (app2:Application {name: "Drug Discovery"})
MATCH (app3:Application {name: "Recommendation Systems"})

CREATE (g)-[:APPLIED_TO]->(app1)
CREATE (g)-[:APPLIED_TO]->(app2)
CREATE (g)-[:APPLIED_TO]->(app3);

// 12. CONNECT TECHNOLOGY MECHANISMS
MATCH (gnn:Technology {name: "Graph Neural Networks"})
MATCH (mp:Mechanism {name: "Message Passing"})
CREATE (gnn)-[:USES_MECHANISM]->(mp);

MATCH (gt:Technology {name: "Graph Transformers"})
MATCH (att:Mechanism {name: "Attention Mechanism"})
MATCH (pos:Mechanism {name: "Positional Encodings"})
CREATE (gt)-[:USES_MECHANISM]->(att)
CREATE (gt)-[:USES_MECHANISM]->(pos);

// 13. CONNECT GML TASKS
MATCH (gml:Concept {name: "Graph Machine Learning"})
MATCH (t1:Task {name: "Node Classification"})
MATCH (t2:Task {name: "Link Prediction"})
MATCH (t3:Task {name: "Graph Generation"})
CREATE (gml)-[:SOLVES_TASK]->(t1)
CREATE (gml)-[:SOLVES_TASK]->(t2)
CREATE (gml)-[:SOLVES_TASK]->(t3);

// 14. CONNECT CHALLENGES AND OPPORTUNITIES
MATCH (g:Concept {name: "Graph Machine Learning"})
MATCH (ch_genai:Challenge {name: "Gen-AI Challenges for GML"})
MATCH (op:Opportunity {name: "Gen-AI Opportunities for GML"})
MATCH (os:Technical {name: "Oversmoothing"})
MATCH (oq:Technical {name: "Oversquashing"})
MATCH (sc:Technical {name: "Scalability Issues"})

CREATE (g)-[:FACES_CHALLENGE]->(ch_genai)
CREATE (g)-[:HAS_OPPORTUNITY]->(op)
CREATE (g)-[:TECHNICAL_CHALLENGE]->(os)
CREATE (g)-[:TECHNICAL_CHALLENGE]->(oq)
CREATE (g)-[:TECHNICAL_CHALLENGE]->(sc);

// 15. CONNECT GEN-AI IMPACT
MATCH (gen:Concept {name: "Generative AI"})
MATCH (g:Concept {name: "Graph Machine Learning"})
MATCH (llmkg:GenAI_Application {name: "LLM-Assisted Knowledge Graph Construction"})
MATCH (hybrid:GenAI_Application {name: "LLM-GNN Hybrid Models"})
MATCH (gp:GenAI_Application {name: "Graph Prompting"})

CREATE (gen)-[:IMPACTS]->(g)
CREATE (gen)-[:ENABLES_APPLICATION]->(llmkg)
CREATE (gen)-[:ENABLES_APPLICATION]->(hybrid)
CREATE (gen)-[:ENABLES_APPLICATION]->(gp);

// ============================================
// RETURN COMPLETION MESSAGE
// ============================================

RETURN " MLoG-GenAI Knowledge Graph Created Successfully!" as Status,
       "Run the queries below to explore your graph" as Next_Step;
// View the complete knowledge graph
MATCH (n)-[r]->(m)
RETURN n, r, m
LIMIT 50;
