<div class="search-container">
  <input type="text" placeholder="Search" class="search-input" />
  <button class="search-button">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search">
      <circle cx="11" cy="11" r="8"></circle>
      <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
    </svg>
  </button>
</div>
.search-container {
  display: flex;
  align-items: center;
  background-color: #f0f2f5;
  border-radius: 0.375rem;
  padding: 0.5rem;
}

.search-input {
  flex-grow: 1;
  margin-right: 0.5rem;
  border: none;
  background-color: transparent;
  outline: none;
  font-size: 1rem;
}

.search-button {
  background-color: transparent;
  border: none;
  outline: none;
  cursor: pointer;
}
