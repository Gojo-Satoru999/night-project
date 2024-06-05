function dijkstra(graph, start) {
    // Initialize distances and priority queue
    const distances = {};
    const priorityQueue = new PriorityQueue();

    // Set initial distances to Infinity, and the start node distance to 0
    for (let vertex in graph) {
        distances[vertex] = Infinity;
    }
    distances[start] = 0;

    // Add the start node to the priority queue
    priorityQueue.enqueue(start, 0);

    while (!priorityQueue.isEmpty()) {
        const { vertex: currentVertex } = priorityQueue.dequeue();

        // Iterate through each neighbor of the current vertex
        for (let neighbor in graph[currentVertex]) {
            let distance = graph[currentVertex][neighbor];
            let newDistance = distances[currentVertex] + distance;

            // If a shorter path is found, update the distance and add the neighbor to the priority queue
            if (newDistance < distances[neighbor]) {
                distances[neighbor] = newDistance;
                priorityQueue.enqueue(neighbor, newDistance);
            }
        }
    }

    return distances;
}

class PriorityQueue {
    constructor() {
        this.queue = [];
    }

    enqueue(vertex, priority) {
        this.queue.push({ vertex, priority });
        this.queue.sort((a, b) => a.priority - b.priority);
    }

    dequeue() {
        return this.queue.shift();
    }

    isEmpty() {
        return this.queue.length === 0;
    }
}

// Example usage
const graph = {
    'A': { 'B': 4, 'C': 2 },
    'B': { 'A': 4, 'C': 5, 'D': 10 },
    'C': { 'A': 2, 'B': 5, 'D': 3 },
    'D': { 'B': 10, 'C': 3 }
};

const startVertex = 'A';
const shortestDistances = dijkstra(graph, startVertex);
console.log(shortestDistances);

