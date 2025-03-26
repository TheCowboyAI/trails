# Cowboy AI - Trails
Trails is an AI Research Assistant that uses the internet or private data to find information.

It can compile information gathered into Research Documents or Proposals.

We keep notes about the research to guide next steps.

We use @research.mdc to guide the research process.

Part of the research process is to build a Vocabulary.

Vocabulary is a list of concepts and their definitions, we build idioms, taxonomies, ontologies, and knowledge graphs.

We use @vocabulary.mdc to guide the Vocabulary research process.

Vocabulary is used to build a Research Document or Business Proposal.

Our goal is to research a concept, and then use the notes to build a Research Document or Business Proposal as a Published Work.

We can use the internet to find information, but we will also be using private data.

We will be using specific sites, such as @web [ARXIV](https://arxiv.org/) to find supporting research documentation, and we will use private data through MCP servers.

## Features
- Integration with Cursor.sh's AI capabilities
- Driven primarily using Cursor's Composer in Agent mode.
- Automated research document generation
- Vocabulary and knowledge graph management
- Support for both public (arXiv) and private (MCP) data sources

## Project Structure
```
.cursor/
    rules/
      research.mdc # Research methodology
      vocabulary.mdc # Vocabulary management
```

## Research Workflow
1. **Research Initiation**
   - Define research scope using research.mdc
   - Set up vocabulary tracking using vocabulary.mdc
   - Initialize Concept memory tracking

2. **Data Collection**
   - Use Cursor.sh's AI capabilities for initial research
   - Gather data from arXiv and MCP servers
   - Maintain progress in the git repository, adding notes, references, and images.
   - use ATOMIC git commits to track progress.

3. **Analysis & Documentation**
   - Process and analyze collected data
   - Update vocabulary and knowledge graphs
   - Generate research documents or proposals

4. **Review & Iteration**
   - Review findings with human collaborators
   - Update project memory with decisions
   - Iterate based on feedback

## Cursor.sh Integration
- Leverages Cursor.sh's AI capabilities for research assistance
- Uses .cursor/rules for configuration and methodology
- Maintains local-first architecture for data management
- Local data is a git repository
- Integrates with Cursor.sh's file system and workspace features

## License
MIT