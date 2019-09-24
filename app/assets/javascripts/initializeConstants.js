function getLimit() {
	var limit;
	if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent))
		limit = 4;
	else
		limit = 10;
	return limit;
}