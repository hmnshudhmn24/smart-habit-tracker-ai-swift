# 📈 Smart Habit Tracker with AI Suggestions

A smart habit-tracking app that helps users improve routines by offering AI-driven suggestions. Track daily habits, visualize progress, and receive motivational tips from an integrated GPT assistant.

## 🧠 Project Description

This SwiftUI app enables users to create and manage personal habits. It uses Core Data to store progress and features a simple chart-like interface. The highlight is a built-in OpenAI API integration that suggests new habits based on the user's history, making it smarter over time.

## 🧰 Tech Stack

- SwiftUI
- Core Data
- Charts (SwiftUI-based)
- OpenAI API (GPT)
- Combine

## 🚀 Features

- Create and manage personal habits
- Track progress with simple UI
- AI-generated habit improvement suggestions
- Motivational quote generation (via GPT)
- Modern and intuitive design

## 🧑‍💻 How to Run

1. **Requirements:**
   - Xcode 14 or later
   - iOS 15 or later

2. **Steps:**
   - Clone the repo:
     ```bash
     git clone https://github.com/yourusername/smart-habit-tracker-ai-swift.git
     ```
   - Open the project in Xcode.
   - Add your [OpenAI API key](https://platform.openai.com/account/api-keys) in the designated method (`fetchAISuggestion()`).
   - Build and run on a simulator or device.

3. **Usage:**
   - Tap to add habits.
   - Track progress by tapping ➕.
   - Get AI-powered suggestions with one tap.
