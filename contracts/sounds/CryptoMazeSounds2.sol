//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract CryptoMazeSounds2 {

	function turnoffSound() public pure returns (string memory) {
		return string('data:audio/wav;base64,UklGRrAsAABXQVZFZm10IBAAAAABAAEAESsAABErAAABAAgATElTVC4AAABJTkZPSUNSRAsAAAAyMDE1LTAxLTIyAABJU0ZUDgAAAExhdmY1OC43Ni4xMDAAZGF0YVYsAACOkJ28v5KfwrGMp8GiirC8lI63s4qWuqeDoLmZg6m0jIewq4KQs599mrOSfaOuhoKrpXyLrpl3la2MeJ+ogH6moHeHqpRzkqmHdJykfHujm3OFp5BwkKaEcpmheHmhmHCDpIxtjqOAcJiedXeflW6BooprjKF9bpacc3adk2yAoIdqjJ97bZWacXWckGqAn4Voi555bJWYb3Scj2h/noNni5x3bJWXbnSbjWd/nYJni5x1bJOXaXp8cXVydXN1dHV1dXV1dXZ2dnZ2dnZ3d3d3d3d3eHh4eHh4eHl4eXl5eXl5eXl5eXp6enp6enp6enp6e3p7e3t7e3t7e3t7e3t7fHx8fHx8fHx8fHx8fHx8fHx8fX19fX19fX19fX19fX19fX19fX19fX19fX1+fX5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn9+f35/fn9/f39/f39/f35/fn9+gH2Ce4R3j6BgYl9iYmJkYWZejKShlGBlY2VkZWZlaGWapKaLX2lkaGZoZ2lnbqSkqYFha2ZqZ2tnbGZ6qqSpdmVsaGxpbWhvZoitp6VuaWtqbGptanBnlayqnWhta2xsbG1sb2yhq62SZm9qbmxubW9tdKqproZncGtvbHBscWt/r6mte2lwbHBtcGxyaYuwqqhxbW9tb25wbXNqmK+sn2twbW9vb3BvcW6jra+UaHJscG5wb3Fvdqurr4lnd6Wup615aqSpqKaplmCFqqOnoqZzZZ+ko6GlkFuCpZ+inqFuYpufn52hi1d/opuemp1pX5mcnJmeh1N9n5ibmJplXZaZmpebhFF8nJaZlphiXJWXmJWZgU97mpSXlJVfW5SVlpOYfk17mZKWk5RdW5OTlZKXfEx6l5GUkpJbWpKSlJGWekt7lpGTkZFZW5KRk5CVeEp7lpCTkJBXW5KQk4+Vdkp8lY+SkI9WW5KQko6UdUp8lY+SjpKNlXdOVX6ZgVdPdpiLYE1slZNqTmOPmXVRW4edgFdVfp2LX1J0mpRpUWqVmnRSYo6efldbhaCJXlZ7npJnU3GamnFUaJSffFdgi6KGXFqCoZBkVniemG5VbpmfeFdlkaKDW16Io41iWX2hlmtWc52ddFdqlqJ/WmKNpIpfXIOjk2dYeaCbcVdvmqF7WWaSpIZdX4ilkGRafqKYbVh0nZ93WGqWpIFbYo2ljGFcg6SVaVl5oZxzV3CYn3tbY2BiYWNiZGNmYYykmqJyYGZjZmVmZmdnZ2mbo6CeamZnZ2hoaGloa2h0pqGmlWZqaGppa2psam1ogaugq4pmbGlsa2xrbWtvaY+toat+Z25rbWxtbW5tb22dq6WndGtubG5tbm5ub251qKeqnm1ubW5ub25wbnFsgK6lrpJqcG1vbnBvcG5ybI6wpK+GanFtcG9wb3Fvcm6brqasemxwbnBvcHBwcXB0pquqpHFucG9xb3Jueq+QaH+pqqeppaqRZXikp6SmoqeRY3KfpKCjn6SRYmybop6hnKGRYmeWoJuemp+SYmKRn5mdmJySY16NnZebl5qTZVqInJaZlpiUZleEm5WYlZeUaVR/mpSWlJWVa1J7mZOVlJOVblF2l5OUk5KVcU9ylpKTk5GVc09ulJKSk5CVdk9qk5KRko+VeU9mkZKQko+UfFBij5KQko6Uf1FejZOPko6TglNbipOOko6ThFVYh5SNk4yUgnOPiI1gUlpSdpKJknpTWlVhjo+OjmJWXVZ8lYyVelZeWGaSkZGQY1lfWYCYjpd7WGBaapWTlJBjW2BchJmQmXpZYltumJSWkGNeYV6ImpKaeVpkXHGalJiQY2BiYIubk5t4W2VddJuVmo9iYWJijpuUnHdcZl13nZWbjmJiYmSRm5WcdV1nXnqelZyMYWRiZpOblpxzXmdefZ+VnYthZWJolZuXm3FfZ1+An5WeiWBlYmqXm5ibb2BlY2VlZY+fmJyXbGJmZGZlZ2ZoZ2lna2V6oZ6coYhjamdpaGppampra2ttapSln6Gec2dsaWxrbGttbG5scGp9paOgpo5obmttbG1tbm5ub25wbZaooqSid2pvbG9tb25wbnFucmx9p6ajqJJqcG5vb29vcHBwcXBzbpaqpKale2txbnFvcXBxcHJwdG59p6ekqZVscW9wcHFxcXFxcnF0bpWrpaemfWxyb3JwcnFycXJxc3F7qqStiY+pn6OgoKGdo41qa3agnp6dnZydm51zZ2eJoJmcmpmbl52JZWVvmpiZmJiXmJWZcGJig5yUl5WVlpOYh2FhapWVlZSUk5SRlm5fX36ZkZSSkpOQlYVfXmaRk5KSkZGSj5RtXFx5l4+SkJCRjpOFXV1jjpGQkJCPkI2TbVtbdpWNkY+Pj42Rhl1bYIuQjo+Pjo+Mkm5ZWnOUjJCOjo6Mj4ZcW1+JkI2Ojo2Pi5JvWVlxk4yPjY2PfFJ0kI6MkIFZXFxcYIyQj46RaVpeX1p6lZCQk4BbX19eZ5GSkpGRZ11gYV2Bl5KSln1cYmFfbZaUlJSQZWBiY2CImJSTmHpeY2Ngc5mVlZaPZGJjZGONmJWUmXZfZGVgeZqVlpiLYmRkZGeSmJaVmHFhZWZhf5uWlpmIYWVlZGuWmJeWl25iZWZihJyXlpqDYWZmY2+ZmJiXlWpjZWZjipuXlpt+YWZmY3Sbl5iZkmdkZmZmjZ2UnIpkZmZnZmdnaWdrZXualpaYkGhoaGlpaWpqamtqbGpuaXqdmpqalm5qbGtsbG1tbW5tb21wbHmenJycmnNrb21vbm9vb3BvcG9xb3een56dnnhscW5wb3BwcHFxcXFycXWdoJ+eoH1scm9xcHFxcnJycnJzc3SboqCfooJsc3BycXJycnJzc3NzdHKYo6Cfo4dtdHBzcXNyc3Nzc3RzdXGVpKGgo4xtdHFzcnNzc3N0c3RzdnGRpp13daChoaCgn5+dnpyfk2xwa3ufm5ybm5qbmZqXnIZlbmWBnZeZl5iWl5aXlJh4YmtkiZmUlpSVlJSTlJOTbGNmZo+Vk5OTk5KSkpGSi2NkYWyTkZKRkZGRkJGOk4FdZV11lI+Rj5CPkI6QjZJ1W2Vcf5OOkI6Pjo+Ojo2PalxiX4eRjo+Ojo6NjY2NimFfXmWNjo6Ojo2NjI2Lj4FbYVtukIyOjY2MjYyNio93WWJaeJGLjoyNjYuPb1lkiI+LjouNi2VcYF5gYGCFko2Pjo2QblxiYGFjX36Vj5GQjpN4XmNiYmVgd5aRkpKPlIJgZGNjZmJwlZOSk5GUimRjZWRmZGqRlZOUkpORamNmZWZmZouXk5WUk5VyYmdlZmhkhJmTlZWSl3tiZ2ZmaWR8mZSVlZOYhGNnZmZpZXSYlZWWk5eMZmZnZmlmbZSXlZaUlpJrZWhnaGhpjpmVl5WVlnNkaWdoaWaHmpWXlpSYe2NpZmloaWlqapGalpiVmXRlamhqaWpqa2tra2xsbWxvan2fmZ2YnY9qbGxsbG1tbW5ubm5vb29vcG+ToZufmqB9anBtb25vb3BwcHBxcHJwc299op6gnaCWcG9wcHBwcXFxcXFycnJzcnRwk6WeopyjhGxyb3JxcnFycnJyc3J0cnVxfKOgoZ+hm3RwcnFycnJyc3Nzc3RzdHN2cZCnn6SdpYluc3FzcnNyc3Nzc3RzdXN1c3qho6GhoKCdnJybm5qamZmYmZeafWhwaXeZmJeXl5eWlpWVlJWTcGZtZX6Yk5WUlJOTk5KTkZSKZ2ZoZYaWkZORkpGRkZCRjpN+YWdkaIySkJGPkI+Pj46PjZBzX2dgb5CPj4+Oj46OjY6NjotoX2ZfeJKNj42OjY2NjI2Lj4NhYWNggpGMjoyNjIyMi42Kj3ldY2BliY6MjYyMjIyMi4yKjW9cZF1ujoyMjIyMi4yLi4qLiGVdY1x4j4uMjIplX2NhZGFojY6OjY6Mj4VhY2JkY2ZicpOOkY6RjZJ9YGZjZmRoYn2Vj5KPko6TdWFnZGdlaGWHlZCTkZKQkW1kZ2ZnZ2hqkJSSkpKRk4xnZ2doZ2lmcpWSlJKUkZWEZGlmaWdrZXyYkpWSlZGWe2RqZ2poa2aGmJKVk5SSlXJlamhqaWpqj5aUlZSTlJBraGlpaWpocZWVlZSVkpaJZmpoamhsZ3mZk5aTlpKXgGVraGtobGeCmpGaeGhqcZKRkZGPkodoamlqamtra2xsbGxtbW5tb21wa32YlZWVk5eEam9tbm5vb29vb3BwcHBxcHJwc26InJeYmJaZf2xyb3FwcXFxcXJycnJzc3Nzc3RykZ2YmpmZmXpvc3FzcnNyc3Nzc3R0dHR1dHV0d5idmpyZm5Z1cnNyc3N0c3R0dHR1dHV1dnR3c36dnJucmZ2RcnRzdHR0dHR0dXV1dXV2dXd1eHOFn5ycnJqeinB1dHN2cYeem31xdXVyhJ6Zm5mamZmYmJeYlpeUmYlscG5vcJKXlZaVlZSUlJOTk5KTkZNyaWtsaX2WkZORkpGRkZGQkY+RjZKCZmloaWuMkY+Qj5CPj46Ojo6Njo2ObWVnaGV5ko2PjY6Njo2NjI2LjYqPfmJmZWZoio6MjYyNjIyMjIuLi4uKi2pjZWZjeJCKjYuMi4yLi4qLioyIjXthZWRkZ4mNi4yLi4uLioqKioqKiYpoYmNlYXiOiouNgGJmZGZlZ2ZoZYGRjY+NjY2MjohnZmdnZ2hnamV6k46Qj4+Oj46Pb2VpaGlpaWtnc5KQkZCQj5COkndlamhqaWpram6PkpGRkZCRjpOAZmtpampramxqiZWRkpGRkZCSiWlqamtqbGptaYKWkZORkpGRkY9uaWtqa2xrbWl6lpKTkpKRkpCTdWdsamtra21rcpOTk5KTkZOQlX1nbGpsa2xsbW2OlZKTk5KTkJSGaGxqbGtsbG1sbmx0kZCQj5COkXdqbmxubW5ubm5vb29wcHBxcHFwc25/l5OUk5OTkXNvcXBxcHFxcnJycnJyc3Nzc3RzdXGJmZWWlpWWjnFycnJzc3Nzc3N0dHR0dHV1dXV1dnWSmZeXl5WZiHB1c3R0dHR0dXV1dXV2dXZ2dnZ3dXuYmZmYmJaZgXF2c3V0dXV1dXZ2dnZ2dnd2d3Z4dIKcmJmYmJeXenN2dHZ1dnV2dnZ2dnZ3d3d3eHZ5dYqdmJmZfnR3dnZ5l5mYmJeXl5eWlpWVlZSVk5V6bnJxcnORlZOUk5OSkpKSkZGRkJGPknlqb21vboySkJGQkI+Pj4+Pjo6NjoyQeGhsam1riJCNj42OjY2NjY2MjIuNio55Zmtoa2iFj4uNjIyMjIuLi4uLiouJjXpkamdqZoGOioyLi4uLioqKioqJioiMe2RpZmplfo6JjIqLioqKioqJioiKh4t9Y2hlaWR8jYmLiYqJiomKiIqHi4FnZHOMiIqJiYmIiYeKg2ZmZmZnZ2hoaWlpho6LjIuLi4uLiY11ZWpoaWlpamlsaHmQjI6NjY2MjYuOhWlqampra2trbGxti5COj46Ojo2OjI92aGxqbGtsbWxuan2TjpCPj4+Oj42Qhmpsa2xsbG1tbm1wjZGQkI+Qj4+PjpB1aW1sbW1tbm1va4CUj5GQkJCPkI6RhWptbG1tbW5ub25yj5KRkZCQkJCQj5B0am5sbm1ubm5vbnBucW19lZGTkZKRko9xbW9ub29wcHBwcHFxcXFycnJycnNzc3Nzj5iUlpSWkpeDbnNxcnFycnNzc3Nzc3R0dHR0dXR1dHdzgZqWmJaXlpaUdnJ0c3RzdHR0dHV1dXV1dXV2dnZ2dnZ3dpKbl5mXmZWah3F1c3V0dXV1dXV1dnZ2dnZ2dnd2eHZ5dYKcmJqYmZiYlnlzdXR1dXV1dnZ2dnZ2dnd3d3d3d3h3eHeSnJiamJqWmolxd3J9lJOTk5KSkpKRkZGRkJGPkXxuc3BzcXWOkZCQj4+Pj46Ojo6OjY6NjYyOh25ub25wbH+QjI6MjYyNjIyMjIuLi4uKi4mMeGlua25sb4mNi4yLi4uLioqKioqJiomKiIqEa2psam1pe42Ji4qKioqJiYmJiYmIiYiJh4p2Z2tpa2pth4uJiomJiYmJiYiIiIiIh4iHiYNqaGppbGh4jIiKiImIiYiIiIiIiIeIh4iGiXZmamlqamqIgWlqcYuJiomJiYmIiYiJhmxpa2pra2xsbGxtbISOioyKi4qLiouJjHlpbWttbG1tbm1vbHmPjI2MjYyMi4yLjIdtbW1tbm5ubm9vb3CJj42OjY2MjYyNi454a29tb25vbnBvcW19kY2PjY6Njo2OjI6FbW9ub29vb3BwcHByjZCOj46Ojo6NjoyOdmxwbnBvcG9xb3JugZKOkI6Pjo+NjoyPg2xwbnBvcHBxcHFwdY+Qj4+Oj46OjXRtcm2BkY2PjY6OjY52bHBucG9wcHBwcXFxcXJycnJzc3NzdHN1cYKVkZKRkZGQknxvc3FzcnNzc3N0dHR0dHR1dXV1dnV2dXd0gZeTlJSTlJKVgXF1c3V0dXV1dXV1dnZ2dnZ2d3Z3d3h2eHWAl5WVlZSVk5aEcnZ0dnV2dnZ2dnZ3d3d3d3d3d3h3eHd5dn6XlpaWlZaTl4hzd3V2dnZ2d3d3d3d3d3d4eHh4eHh5eHl3fZaYlZiBdXh5lJaVlZSVlJSTk5OTkpKSkZGRkJGPknxvcnFyc3F5kpCRkJCQj4+Pj46Ojo6OjY2NjYyMjHJtbm5ucG18kIyOjY2MjYyMjIyLi4uLi4uKi4mLhWxsbGxsbmuBjoqMi4uKi4qKioqKiomJiYmIioeLfmhramtrbGyGjImLioqJiomJiYmJiYiIiIiHiYaKdmdraWpranCKiYmJiYmJiYmIiIiIiIiIh4eHh4aIb2dqaWlraHaMhoWFhIZ/aWtra2tsbG1tbW1ubXKIiYiIiIiIiIiHiIeIhW5sbm1ubm5vb29vcHBxh4uKi4qKioqJiYmJiIlzbW9ucG9wcHBwcXBycISOioyLi4uLiouKi4mMeW1xb3FwcXBxcXJxc3CAj4uNi4yLjIuLiouJjX5ucXBxcXFxcnFycXRwfI+MjYyNjIyLjIuMio2Eb3FwcXFycXJyc3JzcXiOjY2NjYyMjIyLjIuMiHFwcXFycXJycnNyc3N0c3aNjo2NjY2Ni4+CcHNyc3Jzc3NzdHR0dHR1dXV1dXV2dnZ2d3Z4dIOTkJGQkI+Qj495c3V0dXV1dXZ2dnZ2dnZ3d3d3d3d3eHh4eHh4eZCTkpKSkZGQkoh0d3Z2dnd3d3d3d3d3eHh4eHh4eHh4eXh5eHp3hJWSk5KSkpKRkn11eHZ3d3d3eHh4eHh4eHh4eXl5eXl5eXl5eXp6j5WTk5OSk5GTi3Z4d3h3eHd4d3l3fpOSkpKRkZGQkZCQj5GHc3Z0dnR3c3+Sj5CPj4+Pjo6Ojo2NjY2NjYyMi4yKjX1ucnBycXNwg4+LjYuMi4yLi4uLi4qKioqKiomJiYmJdG1wb3BvcHCGjIqLioqJiomJiYmJiYiIiIiIh4iHiIRubW1ubm9tc4mJiYmJiYiIiIiIiIiHh4eHh4eGh4WIfWpubG5sb2x5i4eJiIiIiIiHh4eHh4eHh4eGh4aHhYh2aW1rbWxua3+Kh4iHiIeGb2xubW5ub29vb3BvcW90iouKi4qKioqJiomKiIqDbm9vb29wcHBxcHFwcm96jouMi4uLi4uKi4qLiYx+bXFvcXBxcXFxcXJxc3CBj4uNjIyMjIuLi4uLiox5bnFwcXFxcXJycnJyc3KHj4yNjI2MjIyMi4uLi4p0b3FwcnFycnJyc3JzcnWMjo2NjY2MjIyMi4yKjIdxcXFxcnJycnNyc3J0cXqPjY6NjY2MjIyMi4yKjYFvcnFycXJycnJzc3NzdHN0c3Vze5COj46Ojo2OjI55cXRydHN0c3R0dHR1dXV1dXV2dnZ2dnZ2d3Z3dnh1gpSQkpCRkJCPkI53dHV1dnV2dnZ2dnZ3d3d3d3d3d3h4eHh4eHh5eHp3iZWRk5GSkZKQkot2dnZ2d3d3d3d3d3d4eHh4eHh4eHl5eXl5eXl5eXp5j5WSlJKTkZOQk4d1eHZ3d3d3eHh4eHh4eHh4eXl5eXl5eXl6eXp5iZiHeHp5eXp5e3iIlpKUk5OSkpKSkZGRkJCQkI+Pj4+Pjo6Ojox2cnRzdHN1c3iOj46Ojo6NjY2NjIyMjIyMi4uLi4qLiouJjH5tcW9wcXByb4GOioyKi4qLioqKioqJiYmJiYmJiIiIiIiIhnBtb25vbnBuc4mKiYmJiYmJiYmIiIiIiIiIh4eHh4eGh4WJempubG1ubW9sfouHiYiJiIiIiIeHh4eHh4eHh4eGhoaGhYeEbmtuanyJhoeGh4aHhoeFh4JsbGxsbW1tbW5ub25vbnFtfYyJi4mKiYmJiYmJiIiIiIhybW9ub29vb3BwcHBxcHJveY2LjIuLi4uLioqKiomKiYt4bXBvcHBxcHFxcXFycXNxdYyNjIyMjIyMi4uLi4qLiYx+bXFwcXBxcXFycnJycnNzc4iPjI2MjYyMjIyLjIuMioyEb3FwcXFxcnJycnNyc3J0cYSQjI6MjYyNjIyMjIuMi4uJcnBxcXFxcnJycnNzc3NzdHN0c3iKioqKioqJioiKhXJzc3NzdHR0dHR1dXV1dXV2dnZ2dnZ2d3d3d3d4d3h2f4+Njo2NjYyNi46DdHd1dnZ2dnd3d3d3d3d4eHh4eHh4eHh5eXl5eXl5eniGkY6Qjo+Ojo6Nj391eHd4d3h4eHh4eHh5eXl5eXl5eXl5enp6enp6enp7eoySj5CPkI+Pj46Oe3d5eHl4eXh5eXl5eXl5eXl6enp6enp6ent4hpKPkI99eHp5enp5e3iIko+Qj4+Pj46Ojo6NjY2NjYyMjIyMi4uLi4qLeXN1dHV1dXZ0go6LjIuLi4uKioqKioqJiYmJiYmJiIiIiIiHiXdwcnJycnJ0cX6LiIqIiYiJiIiIiIiIiIeHh4eHh4eGh4aHhYd3bnFwcXFxcnB7ioeIh4iHh4eHh4eHh4aGhoaGhoaGhYaFhoSHd21wb3BwcHFveYmGh4eHh4eGhoaGhoaGhoaFhoSHem1wb3Bxb3+JhoeGh4aGhoaGhoWGhYaEh3ttcG9wcHBwcXFxcXJycnJzcXiKiYmJiYiIiIiIiIeIh4eHh4ZzcHFxcnJycnJzc3Nzc3RzdHOEjImLiYqJiYmJiYmIiYiJh4p9cHNyc3Jzc3NzdHR0dHV0dXN7jIqLioqKioqKioqJiYmJiImGc3Jzc3Nzc3N0dHR0dHV1dXZ1ho2KjIqLioqKioqKiYqJioiLfHF0cnRzdHR0dHR1dXV1dXV2dXeJjYuMi4uLi4uKi4h1dHR0dXV1dXV1dnZ2dnZ2dnd3d3d3d3d3eHh4eHh4eXh6d4KRjo+Ojo2OjY6MjoB0d3Z3d3d3d3d4eHh4eHh4eHh5eXl5eXl5eXl5enp6enp6e42Rj5CPj4+Oj46Oi3h3eHh4eHh4eHh5eXl5eXl5eXl5enp6enp6enp6e3p7enx5hJOQkZCQj5CPj46QgnZ5eHl4eXh5eXl5eXl5eXp6enp6ent5i5KPkI+Qjo+NkIB2eXd5eHl4eneEkY6Pjo6Ojo2NjY2MjIyMjIuLi4uLiouKioqKiYqGc3NzdHR0dHV0domLiouKioqKiomJiYmJiYmIiIiIiIiIiIeHh4eGiHlvcnBycXJxc3B9i4iJiIiIiIiIh4eHh4eHh4eHhoaGhoaGhoWGhYaCcHBwcHBxcXFxc4aIh4iHh4eHh4eGhoaGhoaGhoaGhYWFhYWFhYWEhnhtcG5wb3Fvcm97iYaHhoeGhoaGdG9xcHFxcnFycnJyc3Nzc3N0coKMiYqJiomJiYmJiIiIiIeIh4l+cHJxcnJzc3Nzc3NzdHR0dHVzeYuLi4qKioqKioqJiYmJiYmIiYd0cnNyc3Nzc3R0dHR0dHV1dXZ0ho2KjIqLioqKioqKiomJiYmIi31xdHJzc3R0dHR0dHR1dXV1dnR9jYuMi4uLi4qKioqKiYqJiomKhnNzc3Nzc3R0dHR1dXV1dXV1dnaIjYuMi4uLiouKjIRzdXR1dXV1dXV1dnZ2dnZ2dnd3d3d3d3d4eHh4eHh4eHl4eneDkY6Pjo6Njo2OjI6Idnd2d3d3d3d3d3h4eHh4eHh4eXl5eXl5eXl5eXp6enp6eXt4gpKPkI+Pj4+Oj46Pi3h3eHh4eHh4eHh5eXl5eXl5eXl5enp6enp6enp6ent6e3p8eYGSkJGQkI+Pj4+Oj416d3h4eXh5eXl5eXl5eXl5enp6enp6ent6e3mDko+Rj5COkIp4eXl5eXl6eXp4f5CPj4+Pjo6Ojo2NjY2NjIyMjIyLi4uLi4qKioqJiomLgHF0c3R0dHV0dnN/jYqLiouKioqKiYmJiYmJiYiIiIiIiIiIh4eHh4eHhoh5b3JwcnFycnJzcYKKiImIiIiIiIiHh4eHh4eHh4eGhoaGhoaGhoaFhYWFhXNucG9wcHFwcXFyhYiHiIeHh4eHh4aGhoaGhoaGhoaFhYWFhYSEhISDg4KDfnZ2dXV0dHNycnFycnJyc3Jzc3Ryd4WEhYSEhISEhISEhISEhISDhIOEgXNyc3Nzc3R0dHR0dHV1dXV1dXZ1d4WHhoeGh4aGhoaGhoaGhYWFhYWFhXdzdXR1dXV1dXV2dnZ2dnZ2d3d3doSJh4iHiIeHh4eHh4eHhoaGhoaFh3p0dnV2dXZ2dnZ2dnd3d3d3d3d4doKKiImIiIiIiIiHh4eHh4d6dXd1d3V7iIeHh4eHh4eGh4aHhHZ1dnZ2dnZ2dnZ3d3d3d3d3eHh4eHh4eHh5eXl5eXl5eXl5enl6eYWMiouKioqKiomKiIqAdnl4eXh5eHl5eXl5eXl5eXp6enp6enp6enp6ent7e3t7e3t7fHp+jIyMjIuLi4uLi4qLiXp5eXl6eXp6enp6enp6enp6ent7e3t7e3t7e3t7e3t8e3x7fHt9e4aOjI2MjIyMjIuMioyDeHp5enp6iYuLiouHeXl5eXl6enp6enmGjIqLioqKioqKiYmJiYmJiYiIiIiIiIiHh4eHh4eGh4aIf3R2dXZ2dnZ2d3Z4h4iHiIeHh4eHh4eHhoaGhoaGhoaGhoWFhYWFhYWFhYWEhnlydHR0dHR1dHZ0eoeGhoaGhoaGhoWFhYWFhYWFhYWFhYSEhISEhISEhISEhIN0cnNzc3R0dHR1c36HhYaFhYWFhYWFhYWFhISEhISEhISEhISEhISDdHJzdHJ7hoSFhISEhISEhISEhISEg4SDhIOFeXFzcnNzc3N0dHR0dHR1dXV1dXV2dYKIhoeGh4aGhoaGhoaGhoWFhYWFhYV3c3V0dXR1dXV1dXZ2dnZ2dnd3d3d4homIiIeIh4eHh4eHh4eHhoaGhoaGhHV1dXV1dXZ2dnZ2dnd3d3d3d3d4d3uJiImIiIiIiIiIh4eHh4eHh4aHhoiBdHZ1dnZ2dnZ2d3d3d3d3d3d4d3l2f4qJfnZ5eHh5eISLiIqJiYiJiIiIiIeIe3Z3d3d3eHd4eHh4eHh4eHl5eXl5eXl5eXl6enp6enp6enp6ent6e3t7iYyLjIuLi4uKioqKiol6eHl5eXl5eXl5eXp6enp6enp6enp6e3t7e3t7e3t7e3t7e3x7fHt8e36NjYyMjIyMi4uLi4qLh3l6eXp6enp6enp6enp6ent7e3t7e3t7e3t7e3t7fHx8fHx8fHx8fH17go6MjYyMjIyMjIuLi4uLiot/eHp5enl6eXp5e3mAjIqLiouKioqKiomJiYmJiYmIiIiIiIiIh4eHh4eHh4eGh4aHgnV2dXZ2dnZ2dnZ3doSJh4iHh4eHh4eHh4aGhoaGhoaGhoaFhYWFhYWFhYWFhYSFhIV4cnRzdHR1dHV0dnR7h4aGhoaGhoaFhYWFhYWFhYWFhYWEhISEhISEhISEhISDhIOFf3Jzc3Nzc3R0dHR0dIOGhYaFhYWFhYWFhIWEhn5ydHN0dHR0dXV1dXV2dnZ2dnZ3doOJh4iHh4eHh4eGhoaGhoaGhoaFhoWGgnR0dXV1dXV1dnZ2dnZ2dnd3d3d3d3h2gIqIiYiIiIiIiIeHh4eHh4eGhoaGhoaGd3R2dXZ1dnZ2dnZ3d3d3d3d3d3h3eXd9ioiJiImIiIiIiIiIh4eHh4eHh4aHhod7dHZ1dnZ2dnZ2d3d3d3d3d3h4eHh4eHuJiYmJiYmIiIiIiIiIh4eHh4eHhoeGiH50dnZ2dnV6hIODg4ODg4ODg4ODg4N4dXZ2dnZ3d3d3d3d3d3h4eHh4eHh4eXl5eXl5eXl5eXp6enp6enp6ent5gYmHiIeHh4eGh4aGhoaEeXl5eXl5enp6enp6enp6enp6e3t7e3t7e3t7e3t7e3t7fHx8fHx8fHx8e4WKiImIiYiIiIiHiIeIg3l7ent6e3t7e3t7e3t7e3t7e3x8fHx8fHx8fHx8fHx8fHx8fH18fX19fX2JiYqFe318fXx9fH18h4qJiomJiYmIiIiIiIiIiIeHh4eHh4eHhoaGhoaGhoaGhoWGhYZ/d3l4eXh5eXl5eXp5g4eGhoaGhoaGhoWFhYWFhYWFhYWFhISEhISEhISEhISEhIOEg4V+dXd2d3d3d3d4d3h3gYaEhYSFhISEhISEhISEhISEhISDg4ODg4ODg4ODg4ODg4KDgoR+dXZ2dnZ2d3d3d3h2f4WEhISEhISEhISEhIOEg4SDhH11d3Z3dnmEhISEhISDg4ODg4ODg4ODg4ODg4ODg4OCd3V2dnZ2d3d3d3d3d3d3eHh4eHh4eHh5eIGHhYaFhYWFhYWFhYWFhYSEhISEhISEg4V+dnh3d3d4eHh4eHh4eHh5eXl5eXl5eXp5fYeGhoaGhoaGhoaFhYWFhYWFhYWFhYWEhYR4d3h4eHh4eHh4eXl5eXl5eXl5eXl6enp5g4iGh4aHhoaGhoaGhoaFhYWFhYWFhYWEhn53eHh4eHh4g4aFhYWFhYWFhYWEhYSFfnZ4d3h4eHh4eHh4eXl5eXl5eXl5eXp6enp6enp6enp6e3t7e3t7e3t7e3t8eoCJiIiIiIiIh4eHh4eHh4Z7eXp6enp6enp6ent7e3t7e3t7e3t7e3t7e3x8fHx8fHx8fHx8fHx8fHx8fH18h4qJiYmJiYmIiIiIiIeJgnl7ent7e3t7e3t7e3t7e3x8fHx8fHx8fHx8fHx8fHx9fH18fXx+iIqJiomKhnx8fHx8fHx8fHx8fXuDiomJiYmIiIiIiIiIiIeHh4eHh4eHh4aGhoaGhoaGhoaFhYWFhYWEhnx3eXh4eHl5eXl5eXl6hYaGhoaGhoaFhYWFhYWFhYWFhYSEhISEhISEhISEhISEhIODg4SDhIF2dnZ3d3d3d3d4d3h3f4aEhYSFhISEhISEhISEhISEhIODg4ODg4ODg4ODg4ODg4ODg4KDgoN6dHZ1dnZ2dnd4eXp6fH17enp5eXh4eHh4eHl5eXl5eXl5eXl6eXp5foSCg4ODg4ODg4KCgoKCgoKCgoKCgoKCgoKAeXl5eXl5eXp6enp6enp6enp6ent7e3t7e3yDhISEhISEhIODg4ODg4ODg4ODg4ODg4OCg3x5enp6enp6enp6ent7e3t7e3t7e3t7e3x7gIWEhYSEhISEhISEhISEg4ODg4ODg4ODg4SAeXp6enp6ent7e3t7e3t7e3t7e3t7e3x8fHt8e4CGhIWEhYSEhISEhISEhIR+ent7e3t7e3t7e3t8fHx8fHx8fHx8fHx8fHx8fHx9fX19fX19fX19fX19fX1+fIGHhoaGhoaGhYWFhYWFhYZ/e3x8fHx8fHx8fHx8fH19fX19fX19fX19fX19fX19fX19fX19fX19fX59fn1+fYCHhoeGhoaGhoaGhoWGhYaBe318fHx8fH19fX19fX19fX19fX19fX19fX19hYeGhoaGhoaFhYWFhYWFhYWFfXt8fHx8fHx8fHx8fXyAhoWFhYWFhYWFhYSEhISEhISEhISEhISEhIODg4ODg4ODg4ODg4ODg4KDgXp6enp6enp6enp7ent6gISDhIOEg4ODg4ODg4ODg4ODg4ODg4KCgoKCgoKCgoKCgoKCgoKCgoKBgn94eXl5eXl5eXl6enp6eoKDg4ODg4ODg4OCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKBgnt4eXl5eXmAg4KCgoKCgoKCgoKCgoKCgoKCgoGBgYGBgYGCe3h5eHl5eXl5eXl5enp6enp6enp6enp6e3p7eoCFg4SDhIODg4ODg4ODg4ODg4ODg4OCg4KDgoN+eXp5enp6enp6enp6ent7e3t7e3t7e3t7e3x7f4WEhISEhISEhISEhISEg4ODg4ODg4ODg4OCg4B5enp6enp6enp7e3t7e3t7e3t7e3t7e3x7fHt+hYSFhISEhISEhISEhISEfHp7e3t7e3t7e3t7fHx8fHx8fHx8fHx8fHx8fHx8fH19fX19fX19fX19fX19fX19fX6FhoaGhoaGhoWFhYWFhYSGgnt8fHx8fHx8fHx8fHx8fX19fX19fX19fX19fX19fX19fX19fX19fX19fn5+fn59fn2Ch4aHhoaGhoaGhoaGhYWFhX58fXx8fHx8fX19fX19fX19fX19fX19fX19fX19fX19fX59fn1+fX59gIeGh4aGhoZ/fH19fX19fX19fX19fn2Eh4aGhoaGhoaGhYWFhYWFhYWFhYWEhISEhISEhISEhISEhISDg4ODg4ODg4J7enp6enp7e3t7e3t7e3yEhISEhISEhISDg4ODg4ODg4ODg4ODg4ODg4OCgoKCgoKCgoKCgoKCgoKBgn94eXl5eXl6enp6enp6eX2Eg4ODg4ODg4ODg4ODgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKBgoGCf3h5eHx9fX19fX19fX19fX19fX19fX1+fn5+fn5+fn5+e3p6enp6enp7e3t7e3t7e3t7fHx8fHx9fX19fX5+fn59fX19fX19fX18fHx9fX19fX19fX19fX19fYCBgYGBgYGBgYGBgYGBgH5+fn59fX19fX19fX19fX19fX19fX19fX59fn1/goGCgoGCgX19fX5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5/f39/');
	}

	function buttonSound() public pure returns (string memory) {
		return string('data:audio/wav;base64,UklGRvgDAABXQVZFZm10IBAAAAABAAEAESsAABErAAABAAgATElTVBoAAABJTkZPSVNGVA4AAABMYXZmNTguNzYuMTAwAGRhdGGyAwAAr7q3sKuinINnX1lRUEdMOXXGsrSqpZ2Ja2BaUlFHTTp1xrO1q6adj29gW1JSSE06dseztaunnpFxYVxTUkhNOnbHs7arp56ScmFcU1NITjp2x7S2rKiek3JhXVNTSE46dse0tqyonpNzYV1TU0hOOnbHtLasqJ6Tc2FdU1NITjp2x7S2rKiek3NhXVNTSE46dse0tqyonpNzYV1TU0hOOnbHtLasqJ6Tc2FdU1NITjp2x7S2rKiek3NhXVNTSE47dse0tqyonpNzYV1TU0hOO3bHtLasqJ6Tc2FdU1NITjt2x7S2rKiek3NhXVNTSE47dse0tqyonpNzYV1TU0hOO3bHtLasqJ6Tc2FdU1NITjt2x7S2rKiek3NhXVNTSE47dse0tqyonpNzYV1TU0hOO3bHtLasqJ6Tc2FdU1NITjt2x7S2rKiek3NhXVNTSE47dse0tqyonpNzYV1TU0hOO3bHtLasqJ6Tc2FdU1NITjt2x7S2rKiek3NhXVNTSE47dse0tqyonpNzYV1TU0hOO3bHtLasqJ6Tc2FdU1NITjt2x7S2rKiek3NhXVNTSE47dse0tqyonpNzYV1TU0hOO3bHtLasqJ6Tc2FdU1NITjt2x7S2rKiek3NhXVNTSE47dse0tqyonpNzYV1TU0hOO3bHtLasqJ6Tc2FdU1NITjt2x7S2rKiek3NhXVNTSE47dse0tqyonpNzYV1TU0hOO3bHtLasqJ6Tc2FdU1NITjt2x7S2rKiek3NhXVNTSE47dse0tqyonpNzYV1TU0hOO3bHtLasqJ6Tc2FdU1NITjt2x7S2rKiek3NhXVNTSE47dse0tqyonpNzYV1TU0hOO3bHtLasqJ6Tc2FdU1NITjt2x7S2rKiek3NhXVNTSE47dse0tqyonpNzYV1TU0hOO3bHtLasqJ6Tc2FdU1NITjt2x7S2rKiek3NhXVNTSE47dse0tqyonpNzYV1TU0hOO3bHtLasqJ6Tc2FdU1NITjt2x7S2rKiek3NhXVNTSE47dse0tqyonpNzYV1TU0hOO3bHtLasqJ6Tc2FdU1NITjt2x7S2rKiek3NhXVNTSE47dse0tqyonpNzYV1TU0hOO3bHtLasqJ6Tc2FdU1NITjt2x7S2rKiek3NhXVNTSE47dse0tqyonpNzYV1TU0hOO3bHtLasqJ6Tc2FdU1NITjt2x7S2rKiek3NhXVNTSE47dse0tqyonpNzYV1TU0hOO3bHtLasqJ2SdGZjYGJhZ2V9jQ');
	}
}