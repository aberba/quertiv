module qv.pagination;

struct Pagination 
{
	int currentPage;
	int perPage;
	size_t totalRecords;

	int offset() {
	   	return (this.currentPage - 1) * this.perPage;
	}

	int totalPages() {
		import std.math: ceil;
	   	return cast(int) ceil(cast(float)this.totalRecords/this.perPage);
	}

	int previousPage() {
	   	return this.currentPage - 1;
	}

	int nextPage() {
	   	return this.currentPage + 1;
	}

	// Previous and next pages
	bool hasPreviousPage() {
	   	return (this.previousPage() >= 1) ? true : false;
	}

	bool hasNextPage() {
	   	return (this.nextPage() <= this.totalPages()) ? true : false;
	}
}