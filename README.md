# 🛒 Grocery Store Inventory Management System

**Course:** SW 212 – Data Structures and Algorithms (Open Ended Lab)
**University:** Mehran University of Engineering and Technology, SZAB Campus Khairpur Mir's
**Department:** Software Engineering  |  **Group:** B  |  **Data Structure:** STACK (LIFO)

A desktop inventory application that demonstrates a **manually implemented, array-based Stack**.

| Part | Technology | Responsibility |
|------|-----------|----------------|
| Backend | Java (+ Gson) | Stack, all inventory logic, sales, reports, JSON storage |
| Frontend | Python Tkinter / ttk | GUI only – no stack or inventory logic |
| Link | `subprocess` + JSON | One JSON line per request / response |

---

## 1. Requirements

1. **JDK 17 or newer** (must include `javac`) – check with `java -version` and `javac -version`
2. **Python 3.9 or newer** (from python.org – Tkinter is included) – check with `python --version`
3. **VS Code** (optional extensions: *Python*, *Extension Pack for Java*)

No `pip install` is needed. `lib/gson.jar` is already included.

## 2. Run the project (VS Code)

1. Unzip the project and open the folder: **File → Open Folder → Grocery_Inventory_System**
2. Open the terminal: **Terminal → New Terminal**
3. Run:

```bash
# Windows
python frontend/app.py

# Linux / macOS
python3 frontend/app.py
```

On the first start the program compiles the Java files into the `out/` folder automatically (takes a few seconds). You can also double-click `run.bat` (Windows).

Optional manual compile:

```bash
# Windows
javac -encoding UTF-8 -cp lib/gson.jar -d out backend/*.java

# Run the backend alone (for testing; type one JSON line and press Enter)
java -cp "out;lib/gson.jar" Main data         # Windows
java -cp "out:lib/gson.jar" Main data         # Linux / macOS
{"action":"ping"}
```

## 3. Quick demo

1. Open **Dashboard → Load Sample Data** (pushes 8 sample products).
2. **Product Management**: add a product (PUSH), click a row to edit it (UPDATE), try **Peek TOP**, **Pop TOP**.
3. **Sales Management**: record a sale, then try selling more than the stock.
4. **Reports**: low stock, out of stock, category summary, CSV / text export.
5. Close and reopen the program – all data is still there.

## 4. How the Stack is used

```
index:  0      1      2      3   <- TOP pointer
      [P001] [P002] [P003] [P004] [ ] [ ] ...
```

| Operation | Meaning in this project | Complexity |
|-----------|-------------------------|-----------|
| `push()` | Add a product on TOP | O(1) |
| `pop()` | Remove ONLY the TOP product | O(1) |
| `peek()` | Show the TOP product | O(1) |
| `isEmpty()` / `isFull()` | Underflow / overflow checks | O(1) |
| `display()` | List products TOP → BOTTOM | O(n) |
| `search()` | Find a product by ID | O(n) |
| `update()` | Replace a product in place (order unchanged) | O(n) |

* **Overflow** – pushing into a full stack shows `STACK OVERFLOW` (capacity can be changed in the GUI).
* **Underflow** – popping/peeking an empty stack shows `STACK UNDERFLOW`.
* **Delete** – *Pop TOP* removes only the top product. *Delete Selected* never removes a middle element silently: Java pops the products above it into a **temporary stack**, discards the selected one, then pushes the others back in the same order. Both ask for confirmation.
* **Sales** – a sale only **reduces the quantity** (update in place). No product is popped, so LIFO is never broken.
* **Sorting** – only changes the display (a separate list). The real stack order is never changed.

## 5. Project structure

```
Grocery_Inventory_System/
├── backend/            Product.java, InventoryStack.java, InventoryManager.java, Main.java
├── frontend/           app.py, dashboard.py, product_ui.py, sales_ui.py, report_ui.py, ui_common.py
├── data/               inventory.json, sales.json, activity.json
├── reports/            exported CSV / text reports
├── lib/gson.jar        JSON library
├── docs/               PROJECT_REPORT.md, TESTING.md, PRESENTATION_SCRIPT.md, GITHUB_GUIDE.md
├── README.md  requirements.txt  .gitignore  run.bat  run.sh  compile_backend.bat
└── out/                compiled Java classes (created automatically)
```

(`ui_common.py` is one extra file with shared colours and table helpers.)

## 6. Features

**Implemented**
Dashboard (cards, stack status, quick actions, recent activity, live date/time) · add / view / update / pop / delete products · search by ID, name, category · sort for display · low stock and out of stock alerts · inventory value · stock adjustment · categories and suppliers · sales with history and totals · activity history · reports with CSV and text export · input validation · duplicate ID prevention · JSON persistence with safe writes and backup recovery · Java process error handling (the GUI does not freeze).

**Future enhancements (not implemented)**
Login / user roles · barcode scanning · charts · printing receipts · database (SQLite) · multi-user network version.

## 7. Notes

* Data is stored in `data/*.json`. Delete the three files' contents (keep the empty structure) to start fresh, or copy the folder to back it up.
* This is a local university project. It validates input and writes files safely, but it is **not** an enterprise-grade secure system.

## 8. Troubleshooting

| Problem | Fix |
|---------|-----|
| "Java was not found" | Install JDK 17+, restart VS Code, check `java -version` |
| "javac was not found" | You installed only a JRE. Install the full JDK |
| `No module named tkinter` | Re-install Python from python.org and tick *tcl/tk* (Linux: `sudo apt install python3-tk`) |
| Java compile error shown in a message box | Send the message text; or run the manual compile command to see details |
| Strange data after editing JSON by hand | Delete the broken file – a fresh one is created; a `.bak` copy is also kept |
