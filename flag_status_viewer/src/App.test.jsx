import { render, screen } from '@testing-library/react';
import App from './App';

test('contains Emerald Coast Beach Flags Status Viewer', () => {
  render(<App />);
  const linkElement = screen.getByText(/Emerald Coast Beach Flags Status Viewer/i);
  expect(linkElement).toBeInTheDocument();
});
