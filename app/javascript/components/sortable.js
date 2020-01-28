import Sortable from 'sortablejs';

export const initSortable = () => {
  const list = document.querySelector('.sortable-activities');
  if (list !== null) {
    Sortable.create(list);
  }
};

// initSortable();
