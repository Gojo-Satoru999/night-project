function dijkstra(graph, start) {
    // Initialize distances with infinity and set the distance to the start node to 0
    let distances = {};
    for (let vertex in graph) {
        distances[vertex] = Infinity;
    }
    distances[start] = 0;

    // Priority queue to keep track of vertices to be explored
    let priorityQueue = new Set();
    for (let vertex in graph) {
        priorityQueue.add(vertex);
    }

    // While there are vertices to be processed
    while (priorityQueue.size > 0) {
        // Get the vertex with the minimum distance
        let minVertex = null;
        for (let vertex of priorityQueue) {
            if (minVertex === null || distances[vertex] < distances[minVertex]) {
                minVertex = vertex;
            }
        }

        // Remove the vertex from the priority queue
        priorityQueue.delete(minVertex);

        // Update the distances to the adjacent vertices
        for (let neighbor in graph[minVertex]) {
            let alt = distances[minVertex] + graph[minVertex][neighbor];
            if (alt < distances[neighbor]) {
                distances[neighbor] = alt;
            }
        }
    }

    return distances;
}

// Example usage
const graph = {
    'A': { 'B': 4, 'C': 2 },
    'B': { 'A': 4, 'C': 5, 'D': 10 },
    'C': { 'A': 2, 'B': 5, 'D': 3 },
    'D': { 'B': 10, 'C': 3 }
};

console.log(dijkstra(graph, 'A'));
// Output should be: { 'A': 0, 'B': 4, 'C': 2, 'D': 5 }
